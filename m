Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD93C624D4
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 01:00:20 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3989.1788483610373611865
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 18:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FWjjpOH8;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-46ae77dcd0cso125685fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 18:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788483609; cv=none;
        d=google.com; s=arc-20260327;
        b=a8bQaa0kHEJAR2KVDG/R5v8pagxDN989IGdGfn7MOXGN3jUxRv7vvUKd9Totx474dM
         71lV8lbbbNj/NDjKinS6en8JEW6Tl7pr+6H18xnq5w7sAaNtRnR/dCbYXF1TWWjoF3WP
         zh0xWnSH1U4cGBzDNKtOuIyeV4k8kzihBGmqHvoLiFyOiKRRVnPz1qvtB5RQocY5TSe+
         VzL5ffUPOjZZKiqlyBYAGZPvOmsRwhqYk+m9a/JqDzA9+i93aOdmyLCViBEzlnAJDVGb
         iRJejTMbIRFXz2EcWxy13WN7AFOBNHEFjDiNIeKJC/iqaRfVp/JSBK06NnUKkhz5OL/x
         MDfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Uw2v4FSGI3W4pOSBPOZb1PQB1t4GToX6bxSwKneAG4A=;
        fh=Sz9EADBpfrCLv6q7U9ZBEUz0nl2QuAmXc1tGoo1tqCI=;
        b=cs+eW/S+XhecqHyrjz9TIerFJi7RKQ4gEu8aiMBM2ogFOJAg+9wQZUDwjHlL7JYvEM
         9zP0y29OJ8gyu4WN0IsMs7uSLKKK6WDUHdSrxvxVT9J+TvXMvk68biKv+100vc3mj5pT
         /miHiYvcA2NQaC8d0y1hEINPyCzybb/IgB2UlmNqFUPIjRVsiQKlDQmuxkfcWVdCzyhT
         l5A/JFRnsGA2a/ke2OUEY02HFtEeywLenDJthCk0nvUrY7y4k5nPWe/rX2UePLrpNzdi
         Fd1n+ReCTmAsdiSfRRaOiSm1oLudBe0I1OireXkGV/T5n0e675FqyhJXrqhH0XG0jGaJ
         93LQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788483609; x=1789088409; darn=lists.openembedded.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Uw2v4FSGI3W4pOSBPOZb1PQB1t4GToX6bxSwKneAG4A=;
        b=FWjjpOH8CYmUAhzJKL8g09rxF0O+JyNhkSW8H4dR4KKGB5TCllVHaBWq/53Fwk3P+Z
         sU943PI9l8YeO4kqI9a3x2uL2/txGoNZI/qJDsu3QOwTH4P1apDobGjHmfWkl6W8K1Xx
         Anwj7u+9RRJqtH7vkl2zy7Dl5rXXLH7TncHVPTKn58ZpUS+OL0EielEg8l5gy3U+1MGt
         YUVrxlRONswXbYLfRhZdUIVzpcfbZYa07a/D9VuI6pCi6sF+q+A4u9dYQmeocNLN1/yX
         9P/fuVvAeDqVhK2fXgaX07pytstHoypD6Qcf81fNZkFCGuqSkRGujXcVCPTHwyiTBKf0
         8+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788483609; x=1789088409;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uw2v4FSGI3W4pOSBPOZb1PQB1t4GToX6bxSwKneAG4A=;
        b=Xd46md3pxvOmdZAXbru3XpdK/Wn9373bwjvU1yOZYP/jT3lCdxev6zHO8VH/z14MVb
         PpYTMi/bmGn/pQ2FlIHeOkXjPc/qo7hWa8O6XQsvlJqZzh0tEj9kloOp9RVjGJn0vlGT
         zE0rWlCPvhbBDEUoWYxIz2CuElDln7Uzla+H2s+AaABc4caB7UxsthA8LtnwuCvlatcq
         XUb5KH4SQKJpzMw3QqDHpdokNJdyxD308RPM/VQ+hj79sa8AUDwMY2zl38ytXciBhnUU
         N/6ln5+uelLLoOPxvUN9gHblfQbnzHHO9qUNL46KMcGex01FCLfYm4Sm61mdJadRqp8K
         pBCg==
X-Gm-Message-State: AFuF++lvFfrecHmSOOVfgilwwklNNOaml9rPU6RilozlPcjGj1Jqb9vK
	KSjKIWvGBUEnHUHTD2+PVWI5tuDCcBdapjCq0EwUDmSGoRV/7OhFK69qNflHQ8ydQPg8b3dR1z7
	4sVQNhsvYrFoc8Deyo9zW+akcK3mtfA7kAQ==
X-Gm-Gg: AYBFou2b2KW6FJlRqjWoqk6thHmXiSZV7fLx5NHYip7HDoqfob2LY2zf1zmxqe2CXBM
	5NWrZ7ElXAbDVeAOp/lUfDIhSU2VBeDclfg1DRP7ys8Qx01aNesXVk4rLlh28ubS0FnsUVjihr3
	JLFhBVVuU9UDyIXgWOS+LatzhzMeiP1+fpPozEQsrnyS17QlORHY/RIXufJq5qzpPv8tABic2+T
	yDTEaPLtpffpOrBfb2XGG9oK29u67H0S8m/XyqVU3J/wGiI+/fR1Dz3+zkD8XKzYLvZA0ssHCj8
	YsAR5B9GSgAdl/XwW/uwizXknCc0NyI1Xo4Gvn/BEeAjthoPDenInI77EA==
X-Received: by 2002:a05:6870:c18e:b0:44c:d6f0:7f70 with SMTP id
 586e51a60fabf-475532bfbd7mr2567161fac.17.1788483608710; Thu, 03 Sep 2026
 18:00:08 -0700 (PDT)
MIME-Version: 1.0
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 4 Sep 2026 12:59:56 +1200
X-Gm-Features: AcwNN1Vb0F042UTQKSy1EcyCwXkRtVqbxjY5X8K4cUGoQnOns5scc_0XZ_PZgu4
Message-ID: <CADySD0FCxCM8MSTnqMumLytDUY4xXfJHpu=aXdciOtuVf9TCng@mail.gmail.com>
Subject: [oe][meta-oe] CVE report wrynose branch 31 Aug 2026
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2026 01:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129750

Hello,

Since we no longer receive periodic CVE report emails, release
branches are getting stale with lot of unpatched CVEs.

I am trying to set up a process to resurrect automated emails but that
will take more time.

For now, I have the summary below and if some recipe is of interest to
you then will appreciate any help in patching some CVEs.

7zip : CVE-2026-14266 : https://nvd.nist.gov/vuln/detail/CVE-2026-14266
7zip : CVE-2026-48092 : https://nvd.nist.gov/vuln/detail/CVE-2026-48092
7zip : CVE-2026-48095 : https://nvd.nist.gov/vuln/detail/CVE-2026-48095
7zip : CVE-2026-48101 : https://nvd.nist.gov/vuln/detail/CVE-2026-48101
7zip : CVE-2026-48102 : https://nvd.nist.gov/vuln/detail/CVE-2026-48102
7zip : CVE-2026-48103 : https://nvd.nist.gov/vuln/detail/CVE-2026-48103
7zip : CVE-2026-48104 : https://nvd.nist.gov/vuln/detail/CVE-2026-48104
7zip : CVE-2026-48111 : https://nvd.nist.gov/vuln/detail/CVE-2026-48111
7zip : CVE-2026-48112 : https://nvd.nist.gov/vuln/detail/CVE-2026-48112
freerdp : CVE-2024-32658 : https://nvd.nist.gov/vuln/detail/CVE-2024-32658
freerdp : CVE-2024-32659 : https://nvd.nist.gov/vuln/detail/CVE-2024-32659
freerdp : CVE-2026-22851 : https://nvd.nist.gov/vuln/detail/CVE-2026-22851
freerdp : CVE-2026-22856 : https://nvd.nist.gov/vuln/detail/CVE-2026-22856
freerdp : CVE-2026-22857 : https://nvd.nist.gov/vuln/detail/CVE-2026-22857
freerdp : CVE-2026-22858 : https://nvd.nist.gov/vuln/detail/CVE-2026-22858
freerdp : CVE-2026-22859 : https://nvd.nist.gov/vuln/detail/CVE-2026-22859
freerdp : CVE-2026-23531 : https://nvd.nist.gov/vuln/detail/CVE-2026-23531
freerdp : CVE-2026-23533 : https://nvd.nist.gov/vuln/detail/CVE-2026-23533
freerdp : CVE-2026-23534 : https://nvd.nist.gov/vuln/detail/CVE-2026-23534
freerdp : CVE-2026-23732 : https://nvd.nist.gov/vuln/detail/CVE-2026-23732
freerdp : CVE-2026-23883 : https://nvd.nist.gov/vuln/detail/CVE-2026-23883
freerdp : CVE-2026-23884 : https://nvd.nist.gov/vuln/detail/CVE-2026-23884
freerdp : CVE-2026-23948 : https://nvd.nist.gov/vuln/detail/CVE-2026-23948
freerdp : CVE-2026-24491 : https://nvd.nist.gov/vuln/detail/CVE-2026-24491
freerdp : CVE-2026-24675 : https://nvd.nist.gov/vuln/detail/CVE-2026-24675
freerdp : CVE-2026-24676 : https://nvd.nist.gov/vuln/detail/CVE-2026-24676
freerdp : CVE-2026-24677 : https://nvd.nist.gov/vuln/detail/CVE-2026-24677
freerdp : CVE-2026-24678 : https://nvd.nist.gov/vuln/detail/CVE-2026-24678
freerdp : CVE-2026-24679 : https://nvd.nist.gov/vuln/detail/CVE-2026-24679
freerdp : CVE-2026-24680 : https://nvd.nist.gov/vuln/detail/CVE-2026-24680
freerdp : CVE-2026-24681 : https://nvd.nist.gov/vuln/detail/CVE-2026-24681
freerdp : CVE-2026-24682 : https://nvd.nist.gov/vuln/detail/CVE-2026-24682
freerdp : CVE-2026-24683 : https://nvd.nist.gov/vuln/detail/CVE-2026-24683
freerdp : CVE-2026-24684 : https://nvd.nist.gov/vuln/detail/CVE-2026-24684
freerdp : CVE-2026-25942 : https://nvd.nist.gov/vuln/detail/CVE-2026-25942
freerdp : CVE-2026-25952 : https://nvd.nist.gov/vuln/detail/CVE-2026-25952
freerdp : CVE-2026-25953 : https://nvd.nist.gov/vuln/detail/CVE-2026-25953
freerdp : CVE-2026-25954 : https://nvd.nist.gov/vuln/detail/CVE-2026-25954
freerdp : CVE-2026-25955 : https://nvd.nist.gov/vuln/detail/CVE-2026-25955
freerdp : CVE-2026-25959 : https://nvd.nist.gov/vuln/detail/CVE-2026-25959
freerdp : CVE-2026-25997 : https://nvd.nist.gov/vuln/detail/CVE-2026-25997
freerdp : CVE-2026-26271 : https://nvd.nist.gov/vuln/detail/CVE-2026-26271
freerdp : CVE-2026-26955 : https://nvd.nist.gov/vuln/detail/CVE-2026-26955
freerdp : CVE-2026-26965 : https://nvd.nist.gov/vuln/detail/CVE-2026-26965
freerdp : CVE-2026-26986 : https://nvd.nist.gov/vuln/detail/CVE-2026-26986
freerdp : CVE-2026-27015 : https://nvd.nist.gov/vuln/detail/CVE-2026-27015
freerdp : CVE-2026-27950 : https://nvd.nist.gov/vuln/detail/CVE-2026-27950
freerdp : CVE-2026-27951 : https://nvd.nist.gov/vuln/detail/CVE-2026-27951
freerdp : CVE-2026-29774 : https://nvd.nist.gov/vuln/detail/CVE-2026-29774
freerdp : CVE-2026-29775 : https://nvd.nist.gov/vuln/detail/CVE-2026-29775
freerdp : CVE-2026-29776 : https://nvd.nist.gov/vuln/detail/CVE-2026-29776
freerdp : CVE-2026-31806 : https://nvd.nist.gov/vuln/detail/CVE-2026-31806
freerdp : CVE-2026-31883 : https://nvd.nist.gov/vuln/detail/CVE-2026-31883
freerdp : CVE-2026-31884 : https://nvd.nist.gov/vuln/detail/CVE-2026-31884
freerdp : CVE-2026-31885 : https://nvd.nist.gov/vuln/detail/CVE-2026-31885
freerdp : CVE-2026-31897 : https://nvd.nist.gov/vuln/detail/CVE-2026-31897
freerdp : CVE-2026-33952 : https://nvd.nist.gov/vuln/detail/CVE-2026-33952
freerdp : CVE-2026-33977 : https://nvd.nist.gov/vuln/detail/CVE-2026-33977
freerdp : CVE-2026-33982 : https://nvd.nist.gov/vuln/detail/CVE-2026-33982
freerdp : CVE-2026-33983 : https://nvd.nist.gov/vuln/detail/CVE-2026-33983
freerdp : CVE-2026-33984 : https://nvd.nist.gov/vuln/detail/CVE-2026-33984
freerdp : CVE-2026-33985 : https://nvd.nist.gov/vuln/detail/CVE-2026-33985
freerdp : CVE-2026-33986 : https://nvd.nist.gov/vuln/detail/CVE-2026-33986
freerdp : CVE-2026-33987 : https://nvd.nist.gov/vuln/detail/CVE-2026-33987
freerdp : CVE-2026-33995 : https://nvd.nist.gov/vuln/detail/CVE-2026-33995
freerdp : CVE-2026-40033 : https://nvd.nist.gov/vuln/detail/CVE-2026-40033
freerdp : CVE-2026-40254 : https://nvd.nist.gov/vuln/detail/CVE-2026-40254
freerdp : CVE-2026-44420 : https://nvd.nist.gov/vuln/detail/CVE-2026-44420
freerdp : CVE-2026-44421 : https://nvd.nist.gov/vuln/detail/CVE-2026-44421
freerdp : CVE-2026-44422 : https://nvd.nist.gov/vuln/detail/CVE-2026-44422
freerdp : CVE-2026-45700 : https://nvd.nist.gov/vuln/detail/CVE-2026-45700
freerdp : CVE-2026-55191 : https://nvd.nist.gov/vuln/detail/CVE-2026-55191
freerdp : CVE-2026-55192 : https://nvd.nist.gov/vuln/detail/CVE-2026-55192
freerdp : CVE-2026-55193 : https://nvd.nist.gov/vuln/detail/CVE-2026-55193
freerdp : CVE-2026-55194 : https://nvd.nist.gov/vuln/detail/CVE-2026-55194
freerdp : CVE-2026-55564 : https://nvd.nist.gov/vuln/detail/CVE-2026-55564
freerdp : CVE-2026-55648 : https://nvd.nist.gov/vuln/detail/CVE-2026-55648
freerdp : CVE-2026-55827 : https://nvd.nist.gov/vuln/detail/CVE-2026-55827
freerdp : CVE-2026-56297 : https://nvd.nist.gov/vuln/detail/CVE-2026-56297
freerdp : CVE-2026-57156 : https://nvd.nist.gov/vuln/detail/CVE-2026-57156
freerdp : CVE-2026-57157 : https://nvd.nist.gov/vuln/detail/CVE-2026-57157
freerdp : CVE-2026-63117 : https://nvd.nist.gov/vuln/detail/CVE-2026-63117
freerdp : CVE-2026-63633 : https://nvd.nist.gov/vuln/detail/CVE-2026-63633
freerdp : CVE-2026-63652 : https://nvd.nist.gov/vuln/detail/CVE-2026-63652
freerdp : CVE-2026-64620 : https://nvd.nist.gov/vuln/detail/CVE-2026-64620
freerdp : CVE-2026-64621 : https://nvd.nist.gov/vuln/detail/CVE-2026-64621
freerdp : CVE-2026-64624 : https://nvd.nist.gov/vuln/detail/CVE-2026-64624
freerdp : CVE-2026-66401 : https://nvd.nist.gov/vuln/detail/CVE-2026-66401
freerdp : CVE-2026-66402 : https://nvd.nist.gov/vuln/detail/CVE-2026-66402
freerdp : CVE-2026-67288 : https://nvd.nist.gov/vuln/detail/CVE-2026-67288
freerdp : CVE-2026-67289 : https://nvd.nist.gov/vuln/detail/CVE-2026-67289
freerdp : CVE-2026-67290 : https://nvd.nist.gov/vuln/detail/CVE-2026-67290
freerdp : CVE-2026-67291 : https://nvd.nist.gov/vuln/detail/CVE-2026-67291
freerdp : CVE-2026-67292 : https://nvd.nist.gov/vuln/detail/CVE-2026-67292
freerdp : CVE-2026-67293 : https://nvd.nist.gov/vuln/detail/CVE-2026-67293
freerdp : CVE-2026-67294 : https://nvd.nist.gov/vuln/detail/CVE-2026-67294
freerdp : CVE-2026-67295 : https://nvd.nist.gov/vuln/detail/CVE-2026-67295
freerdp : CVE-2026-67296 : https://nvd.nist.gov/vuln/detail/CVE-2026-67296
freerdp : CVE-2026-67297 : https://nvd.nist.gov/vuln/detail/CVE-2026-67297
freerdp : CVE-2026-67298 : https://nvd.nist.gov/vuln/detail/CVE-2026-67298
freerdp : CVE-2026-67299 : https://nvd.nist.gov/vuln/detail/CVE-2026-67299
freerdp : CVE-2026-67300 : https://nvd.nist.gov/vuln/detail/CVE-2026-67300
freerdp : CVE-2026-67301 : https://nvd.nist.gov/vuln/detail/CVE-2026-67301
freerdp : CVE-2026-67302 : https://nvd.nist.gov/vuln/detail/CVE-2026-67302
freerdp : CVE-2026-67303 : https://nvd.nist.gov/vuln/detail/CVE-2026-67303
freerdp : CVE-2026-67304 : https://nvd.nist.gov/vuln/detail/CVE-2026-67304
freerdp : CVE-2026-67305 : https://nvd.nist.gov/vuln/detail/CVE-2026-67305
freerdp : CVE-2026-67306 : https://nvd.nist.gov/vuln/detail/CVE-2026-67306
freerdp : CVE-2026-68579 : https://nvd.nist.gov/vuln/detail/CVE-2026-68579
freerdp : CVE-2026-68580 : https://nvd.nist.gov/vuln/detail/CVE-2026-68580
freerdp : CVE-2026-73241 : https://nvd.nist.gov/vuln/detail/CVE-2026-73241
freerdp : CVE-2026-73242 : https://nvd.nist.gov/vuln/detail/CVE-2026-73242
freerdp3 : CVE-2026-40033 : https://nvd.nist.gov/vuln/detail/CVE-2026-40033
freerdp3 : CVE-2026-40254 : https://nvd.nist.gov/vuln/detail/CVE-2026-40254
freerdp3 : CVE-2026-44420 : https://nvd.nist.gov/vuln/detail/CVE-2026-44420
freerdp3 : CVE-2026-44421 : https://nvd.nist.gov/vuln/detail/CVE-2026-44421
freerdp3 : CVE-2026-44422 : https://nvd.nist.gov/vuln/detail/CVE-2026-44422
freerdp3 : CVE-2026-45700 : https://nvd.nist.gov/vuln/detail/CVE-2026-45700
freerdp3 : CVE-2026-55191 : https://nvd.nist.gov/vuln/detail/CVE-2026-55191
freerdp3 : CVE-2026-55192 : https://nvd.nist.gov/vuln/detail/CVE-2026-55192
freerdp3 : CVE-2026-55193 : https://nvd.nist.gov/vuln/detail/CVE-2026-55193
freerdp3 : CVE-2026-55194 : https://nvd.nist.gov/vuln/detail/CVE-2026-55194
freerdp3 : CVE-2026-55564 : https://nvd.nist.gov/vuln/detail/CVE-2026-55564
freerdp3 : CVE-2026-55648 : https://nvd.nist.gov/vuln/detail/CVE-2026-55648
freerdp3 : CVE-2026-55827 : https://nvd.nist.gov/vuln/detail/CVE-2026-55827
freerdp3 : CVE-2026-57156 : https://nvd.nist.gov/vuln/detail/CVE-2026-57156
freerdp3 : CVE-2026-57157 : https://nvd.nist.gov/vuln/detail/CVE-2026-57157
freerdp3 : CVE-2026-57158 : https://nvd.nist.gov/vuln/detail/CVE-2026-57158
freerdp3 : CVE-2026-63117 : https://nvd.nist.gov/vuln/detail/CVE-2026-63117
freerdp3 : CVE-2026-63633 : https://nvd.nist.gov/vuln/detail/CVE-2026-63633
freerdp3 : CVE-2026-63652 : https://nvd.nist.gov/vuln/detail/CVE-2026-63652
freerdp3 : CVE-2026-64620 : https://nvd.nist.gov/vuln/detail/CVE-2026-64620
freerdp3 : CVE-2026-64621 : https://nvd.nist.gov/vuln/detail/CVE-2026-64621
freerdp3 : CVE-2026-64624 : https://nvd.nist.gov/vuln/detail/CVE-2026-64624
freerdp3 : CVE-2026-66401 : https://nvd.nist.gov/vuln/detail/CVE-2026-66401
freerdp3 : CVE-2026-66402 : https://nvd.nist.gov/vuln/detail/CVE-2026-66402
freerdp3 : CVE-2026-67288 : https://nvd.nist.gov/vuln/detail/CVE-2026-67288
freerdp3 : CVE-2026-67289 : https://nvd.nist.gov/vuln/detail/CVE-2026-67289
freerdp3 : CVE-2026-67290 : https://nvd.nist.gov/vuln/detail/CVE-2026-67290
freerdp3 : CVE-2026-67291 : https://nvd.nist.gov/vuln/detail/CVE-2026-67291
freerdp3 : CVE-2026-67292 : https://nvd.nist.gov/vuln/detail/CVE-2026-67292
freerdp3 : CVE-2026-67293 : https://nvd.nist.gov/vuln/detail/CVE-2026-67293
freerdp3 : CVE-2026-67294 : https://nvd.nist.gov/vuln/detail/CVE-2026-67294
freerdp3 : CVE-2026-67295 : https://nvd.nist.gov/vuln/detail/CVE-2026-67295
freerdp3 : CVE-2026-67296 : https://nvd.nist.gov/vuln/detail/CVE-2026-67296
freerdp3 : CVE-2026-67297 : https://nvd.nist.gov/vuln/detail/CVE-2026-67297
freerdp3 : CVE-2026-67298 : https://nvd.nist.gov/vuln/detail/CVE-2026-67298
freerdp3 : CVE-2026-67299 : https://nvd.nist.gov/vuln/detail/CVE-2026-67299
freerdp3 : CVE-2026-67300 : https://nvd.nist.gov/vuln/detail/CVE-2026-67300
freerdp3 : CVE-2026-67301 : https://nvd.nist.gov/vuln/detail/CVE-2026-67301
freerdp3 : CVE-2026-67302 : https://nvd.nist.gov/vuln/detail/CVE-2026-67302
freerdp3 : CVE-2026-67303 : https://nvd.nist.gov/vuln/detail/CVE-2026-67303
freerdp3 : CVE-2026-67304 : https://nvd.nist.gov/vuln/detail/CVE-2026-67304
freerdp3 : CVE-2026-67305 : https://nvd.nist.gov/vuln/detail/CVE-2026-67305
freerdp3 : CVE-2026-67306 : https://nvd.nist.gov/vuln/detail/CVE-2026-67306
freerdp3 : CVE-2026-68579 : https://nvd.nist.gov/vuln/detail/CVE-2026-68579
freerdp3 : CVE-2026-68580 : https://nvd.nist.gov/vuln/detail/CVE-2026-68580
freerdp3 : CVE-2026-73241 : https://nvd.nist.gov/vuln/detail/CVE-2026-73241
freerdp3 : CVE-2026-73242 : https://nvd.nist.gov/vuln/detail/CVE-2026-73242
libmodplug : CVE-2026-75904 : https://nvd.nist.gov/vuln/detail/CVE-2026-75904
libsoup-2.4 : CVE-2025-11021 : https://nvd.nist.gov/vuln/detail/CVE-2025-11021
libsoup-2.4 : CVE-2025-12105 : https://nvd.nist.gov/vuln/detail/CVE-2025-12105
libsoup-2.4 : CVE-2025-32051 : https://nvd.nist.gov/vuln/detail/CVE-2025-32051
libsoup-2.4 : CVE-2025-32908 : https://nvd.nist.gov/vuln/detail/CVE-2025-32908
libsoup-2.4 : CVE-2026-12548 : https://nvd.nist.gov/vuln/detail/CVE-2026-12548
libsoup-2.4 : CVE-2026-12549 : https://nvd.nist.gov/vuln/detail/CVE-2026-12549
libsoup-2.4 : CVE-2026-1536 : https://nvd.nist.gov/vuln/detail/CVE-2026-1536
libsoup-2.4 : CVE-2026-2436 : https://nvd.nist.gov/vuln/detail/CVE-2026-2436
libsoup-2.4 : CVE-2026-2708 : https://nvd.nist.gov/vuln/detail/CVE-2026-2708
libsoup-2.4 : CVE-2026-3099 : https://nvd.nist.gov/vuln/detail/CVE-2026-3099
libsoup-2.4 : CVE-2026-3632 : https://nvd.nist.gov/vuln/detail/CVE-2026-3632
libsoup-2.4 : CVE-2026-3633 : https://nvd.nist.gov/vuln/detail/CVE-2026-3633
libsoup-2.4 : CVE-2026-3634 : https://nvd.nist.gov/vuln/detail/CVE-2026-3634
libsoup-2.4 : CVE-2026-4271 : https://nvd.nist.gov/vuln/detail/CVE-2026-4271
libsoup-2.4 : CVE-2026-66337 : https://nvd.nist.gov/vuln/detail/CVE-2026-66337
libsoup-2.4 : CVE-2026-66338 : https://nvd.nist.gov/vuln/detail/CVE-2026-66338
libsoup-2.4 : CVE-2026-66339 : https://nvd.nist.gov/vuln/detail/CVE-2026-66339
libuvc : CVE-2026-1991 : https://nvd.nist.gov/vuln/detail/CVE-2026-1991
libvncserver : CVE-2026-32853 : https://nvd.nist.gov/vuln/detail/CVE-2026-32853
libvncserver : CVE-2026-32854 : https://nvd.nist.gov/vuln/detail/CVE-2026-32854
libvncserver : CVE-2026-44988 : https://nvd.nist.gov/vuln/detail/CVE-2026-44988
libvncserver : CVE-2026-50538 : https://nvd.nist.gov/vuln/detail/CVE-2026-50538
mailcap : CVE-2026-10037 : https://nvd.nist.gov/vuln/detail/CVE-2026-10037
mariadb : CVE-2023-52970 : https://nvd.nist.gov/vuln/detail/CVE-2023-52970
mariadb : CVE-2023-52971 : https://nvd.nist.gov/vuln/detail/CVE-2023-52971
minio : CVE-2021-41137 : https://nvd.nist.gov/vuln/detail/CVE-2021-41137
minio : CVE-2022-24842 : https://nvd.nist.gov/vuln/detail/CVE-2022-24842
minio : CVE-2022-31028 : https://nvd.nist.gov/vuln/detail/CVE-2022-31028
minio : CVE-2023-25812 : https://nvd.nist.gov/vuln/detail/CVE-2023-25812
minio : CVE-2023-27589 : https://nvd.nist.gov/vuln/detail/CVE-2023-27589
minio : CVE-2023-28432 : https://nvd.nist.gov/vuln/detail/CVE-2023-28432
minio : CVE-2024-24747 : https://nvd.nist.gov/vuln/detail/CVE-2024-24747
minio : CVE-2024-55949 : https://nvd.nist.gov/vuln/detail/CVE-2024-55949
minio : CVE-2025-27414 : https://nvd.nist.gov/vuln/detail/CVE-2025-27414
minio : CVE-2025-31489 : https://nvd.nist.gov/vuln/detail/CVE-2025-31489
minio : CVE-2025-62506 : https://nvd.nist.gov/vuln/detail/CVE-2025-62506
minio : CVE-2026-33322 : https://nvd.nist.gov/vuln/detail/CVE-2026-33322
minio : CVE-2026-39414 : https://nvd.nist.gov/vuln/detail/CVE-2026-39414
minio : CVE-2026-40344 : https://nvd.nist.gov/vuln/detail/CVE-2026-40344
minio : CVE-2026-41145 : https://nvd.nist.gov/vuln/detail/CVE-2026-41145
minio : CVE-2026-42600 : https://nvd.nist.gov/vuln/detail/CVE-2026-42600
mpd : CVE-2026-49127 : https://nvd.nist.gov/vuln/detail/CVE-2026-49127
mpd : CVE-2026-49128 : https://nvd.nist.gov/vuln/detail/CVE-2026-49128
mpd : CVE-2026-49129 : https://nvd.nist.gov/vuln/detail/CVE-2026-49129
mpd : CVE-2026-49130 : https://nvd.nist.gov/vuln/detail/CVE-2026-49130
msgpack-c : CVE-2026-72854 : https://nvd.nist.gov/vuln/detail/CVE-2026-72854
mtr : CVE-2026-14461 : https://nvd.nist.gov/vuln/detail/CVE-2026-14461
ncp : CVE-2025-14577 : https://nvd.nist.gov/vuln/detail/CVE-2025-14577
ncp : CVE-2026-35087 : https://nvd.nist.gov/vuln/detail/CVE-2026-35087
neatvnc : CVE-2026-42859 : https://nvd.nist.gov/vuln/detail/CVE-2026-42859
netdata : CVE-2024-32019 : https://nvd.nist.gov/vuln/detail/CVE-2024-32019
netdata : CVE-2025-71385 : https://nvd.nist.gov/vuln/detail/CVE-2025-71385
nginx : CVE-2026-1642 : https://nvd.nist.gov/vuln/detail/CVE-2026-1642
nginx : CVE-2026-40460 : https://nvd.nist.gov/vuln/detail/CVE-2026-40460
nginx : CVE-2026-40701 : https://nvd.nist.gov/vuln/detail/CVE-2026-40701
nginx : CVE-2026-42055 : https://nvd.nist.gov/vuln/detail/CVE-2026-42055
nginx : CVE-2026-42533 : https://nvd.nist.gov/vuln/detail/CVE-2026-42533
nginx : CVE-2026-42934 : https://nvd.nist.gov/vuln/detail/CVE-2026-42934
nginx : CVE-2026-42945 : https://nvd.nist.gov/vuln/detail/CVE-2026-42945
nginx : CVE-2026-42946 : https://nvd.nist.gov/vuln/detail/CVE-2026-42946
nginx : CVE-2026-48142 : https://nvd.nist.gov/vuln/detail/CVE-2026-48142
nginx : CVE-2026-56434 : https://nvd.nist.gov/vuln/detail/CVE-2026-56434
nginx : CVE-2026-60005 : https://nvd.nist.gov/vuln/detail/CVE-2026-60005
nginx : CVE-2026-9256 : https://nvd.nist.gov/vuln/detail/CVE-2026-9256
ngtcp2 : CVE-2024-52811 : https://nvd.nist.gov/vuln/detail/CVE-2024-52811
nilfs-utils : CVE-2026-55392 : https://nvd.nist.gov/vuln/detail/CVE-2026-55392
nmap : CVE-2026-72712 : https://nvd.nist.gov/vuln/detail/CVE-2026-72712
nodejs : CVE-2025-47153 : https://nvd.nist.gov/vuln/detail/CVE-2025-47153
ntfs-3g-ntfsprogs : CVE-2026-40706 :
https://nvd.nist.gov/vuln/detail/CVE-2026-40706
ntopng : CVE-2026-38968 : https://nvd.nist.gov/vuln/detail/CVE-2026-38968
ntopng : CVE-2026-45448 : https://nvd.nist.gov/vuln/detail/CVE-2026-45448
ntpsec : CVE-2016-1547 : https://nvd.nist.gov/vuln/detail/CVE-2016-1547
ntpsec : CVE-2016-1548 : https://nvd.nist.gov/vuln/detail/CVE-2016-1548
ntpsec : CVE-2016-1549 : https://nvd.nist.gov/vuln/detail/CVE-2016-1549
ntpsec : CVE-2016-1550 : https://nvd.nist.gov/vuln/detail/CVE-2016-1550
ntpsec : CVE-2016-1551 : https://nvd.nist.gov/vuln/detail/CVE-2016-1551
ntpsec : CVE-2026-18321 : https://nvd.nist.gov/vuln/detail/CVE-2026-18321
open62541 : CVE-2026-11946 : https://nvd.nist.gov/vuln/detail/CVE-2026-11946
open62541 : CVE-2026-18785 : https://nvd.nist.gov/vuln/detail/CVE-2026-18785
open62541 : CVE-2026-33592 : https://nvd.nist.gov/vuln/detail/CVE-2026-33592
open62541 : CVE-2026-63035 : https://nvd.nist.gov/vuln/detail/CVE-2026-63035
open62541 : CVE-2026-63362 : https://nvd.nist.gov/vuln/detail/CVE-2026-63362
open62541 : CVE-2026-63559 : https://nvd.nist.gov/vuln/detail/CVE-2026-63559
open62541 : CVE-2026-65423 : https://nvd.nist.gov/vuln/detail/CVE-2026-65423
openflow : CVE-2017-1000411 : https://nvd.nist.gov/vuln/detail/CVE-2017-1000411
openflow : CVE-2018-1000155 : https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
opentelemetry-cpp : CVE-2026-44967 :
https://nvd.nist.gov/vuln/detail/CVE-2026-44967
openvpn : CVE-2026-11604 : https://nvd.nist.gov/vuln/detail/CVE-2026-11604
openvpn : CVE-2026-11771 : https://nvd.nist.gov/vuln/detail/CVE-2026-11771
openvpn : CVE-2026-12932 : https://nvd.nist.gov/vuln/detail/CVE-2026-12932
openvpn : CVE-2026-12996 : https://nvd.nist.gov/vuln/detail/CVE-2026-12996
openvpn : CVE-2026-13122 : https://nvd.nist.gov/vuln/detail/CVE-2026-13122
openvpn : CVE-2026-13379 : https://nvd.nist.gov/vuln/detail/CVE-2026-13379
openvpn : CVE-2026-13698 : https://nvd.nist.gov/vuln/detail/CVE-2026-13698
openvpn : CVE-2026-35058 : https://nvd.nist.gov/vuln/detail/CVE-2026-35058
openvpn : CVE-2026-63649 : https://nvd.nist.gov/vuln/detail/CVE-2026-63649
openvpn : CVE-2026-63650 : https://nvd.nist.gov/vuln/detail/CVE-2026-63650
pcapplusplus : CVE-2026-13587 : https://nvd.nist.gov/vuln/detail/CVE-2026-13587
pcapplusplus : CVE-2026-13588 : https://nvd.nist.gov/vuln/detail/CVE-2026-13588
pcapplusplus : CVE-2026-13589 : https://nvd.nist.gov/vuln/detail/CVE-2026-13589
pcapplusplus : CVE-2026-13590 : https://nvd.nist.gov/vuln/detail/CVE-2026-13590
pipewire : CVE-2026-5674 : https://nvd.nist.gov/vuln/detail/CVE-2026-5674
polkit : CVE-2016-2568 : https://nvd.nist.gov/vuln/detail/CVE-2016-2568
poppler : CVE-2025-52885 : https://nvd.nist.gov/vuln/detail/CVE-2025-52885
postfix : CVE-2023-32182 : https://nvd.nist.gov/vuln/detail/CVE-2023-32182
postgresql : CVE-2026-14662 : https://nvd.nist.gov/vuln/detail/CVE-2026-14662
postgresql : CVE-2026-14663 : https://nvd.nist.gov/vuln/detail/CVE-2026-14663
postgresql : CVE-2026-14664 : https://nvd.nist.gov/vuln/detail/CVE-2026-14664
postgresql : CVE-2026-14666 : https://nvd.nist.gov/vuln/detail/CVE-2026-14666
postgresql : CVE-2026-14668 : https://nvd.nist.gov/vuln/detail/CVE-2026-14668
postgresql : CVE-2026-14669 : https://nvd.nist.gov/vuln/detail/CVE-2026-14669
postgresql : CVE-2026-14670 : https://nvd.nist.gov/vuln/detail/CVE-2026-14670
postgresql : CVE-2026-14671 : https://nvd.nist.gov/vuln/detail/CVE-2026-14671
postgresql : CVE-2026-14672 : https://nvd.nist.gov/vuln/detail/CVE-2026-14672
postgresql : CVE-2026-14677 : https://nvd.nist.gov/vuln/detail/CVE-2026-14677
postgresql : CVE-2026-14678 : https://nvd.nist.gov/vuln/detail/CVE-2026-14678
postgresql : CVE-2026-14679 : https://nvd.nist.gov/vuln/detail/CVE-2026-14679
postgresql : CVE-2026-14680 : https://nvd.nist.gov/vuln/detail/CVE-2026-14680
postgresql : CVE-2026-14681 : https://nvd.nist.gov/vuln/detail/CVE-2026-14681
postgresql : CVE-2026-15741 : https://nvd.nist.gov/vuln/detail/CVE-2026-15741
postgresql : CVE-2026-15742 : https://nvd.nist.gov/vuln/detail/CVE-2026-15742
postgresql : CVE-2026-16238 : https://nvd.nist.gov/vuln/detail/CVE-2026-16238
postgresql : CVE-2026-16239 : https://nvd.nist.gov/vuln/detail/CVE-2026-16239
postgresql : CVE-2026-16241 : https://nvd.nist.gov/vuln/detail/CVE-2026-16241
postgresql : CVE-2026-18024 : https://nvd.nist.gov/vuln/detail/CVE-2026-18024
postgresql : CVE-2026-18408 : https://nvd.nist.gov/vuln/detail/CVE-2026-18408
postgresql : CVE-2026-19385 : https://nvd.nist.gov/vuln/detail/CVE-2026-19385
postgresql : CVE-2026-6464 : https://nvd.nist.gov/vuln/detail/CVE-2026-6464
postgresql : CVE-2026-6469 : https://nvd.nist.gov/vuln/detail/CVE-2026-6469
postgresql : CVE-2026-6470 : https://nvd.nist.gov/vuln/detail/CVE-2026-6470
postgresql : CVE-2026-6471 : https://nvd.nist.gov/vuln/detail/CVE-2026-6471
proftpd : CVE-2026-35025 : https://nvd.nist.gov/vuln/detail/CVE-2026-35025
proftpd : CVE-2026-53994 : https://nvd.nist.gov/vuln/detail/CVE-2026-53994
python3-aiohttp : CVE-2026-54273 :
https://nvd.nist.gov/vuln/detail/CVE-2026-54273
python3-aiohttp : CVE-2026-59881 :
https://nvd.nist.gov/vuln/detail/CVE-2026-59881
python3-aiohttp : CVE-2026-69243 :
https://nvd.nist.gov/vuln/detail/CVE-2026-69243
python3-aiohttp : CVE-2026-69244 :
https://nvd.nist.gov/vuln/detail/CVE-2026-69244
python3-django : CVE-2024-21520 :
https://nvd.nist.gov/vuln/detail/CVE-2024-21520
python3-django : CVE-2026-15307 :
https://nvd.nist.gov/vuln/detail/CVE-2026-15307
python3-django : CVE-2026-15337 :
https://nvd.nist.gov/vuln/detail/CVE-2026-15337
python3-django : CVE-2026-15830 :
https://nvd.nist.gov/vuln/detail/CVE-2026-15830
python3-django : CVE-2026-15920 :
https://nvd.nist.gov/vuln/detail/CVE-2026-15920
python3-eventlet : CVE-2023-29483 :
https://nvd.nist.gov/vuln/detail/CVE-2023-29483
python3-flask : CVE-2025-47278 : https://nvd.nist.gov/vuln/detail/CVE-2025-47278
python3-flask-user : CVE-2021-23401 :
https://nvd.nist.gov/vuln/detail/CVE-2021-23401
python3-grpcio-tools : CVE-2023-33953 :
https://nvd.nist.gov/vuln/detail/CVE-2023-33953
python3-grpcio-tools : CVE-2024-37168 :
https://nvd.nist.gov/vuln/detail/CVE-2024-37168
python3-grpcio-tools : CVE-2026-33186 :
https://nvd.nist.gov/vuln/detail/CVE-2026-33186
python3-gunicorn : CVE-2024-1135 :
https://nvd.nist.gov/vuln/detail/CVE-2024-1135
python3-h11 : CVE-2025-43859 : https://nvd.nist.gov/vuln/detail/CVE-2025-43859
python3-m2crypto : CVE-2023-50781 :
https://nvd.nist.gov/vuln/detail/CVE-2023-50781
python3-marshmallow : CVE-2025-68480 :
https://nvd.nist.gov/vuln/detail/CVE-2025-68480
python3-nltk : CVE-2026-12199 : https://nvd.nist.gov/vuln/detail/CVE-2026-12199
python3-nltk : CVE-2026-12259 : https://nvd.nist.gov/vuln/detail/CVE-2026-12259
python3-nltk : CVE-2026-12261 : https://nvd.nist.gov/vuln/detail/CVE-2026-12261
python3-nltk : CVE-2026-12372 : https://nvd.nist.gov/vuln/detail/CVE-2026-12372
python3-nltk : CVE-2026-54293 : https://nvd.nist.gov/vuln/detail/CVE-2026-54293
python3-nltk : CVE-2026-62385 : https://nvd.nist.gov/vuln/detail/CVE-2026-62385
python3-nltk : CVE-2026-62388 : https://nvd.nist.gov/vuln/detail/CVE-2026-62388
python3-nltk : CVE-2026-63311 : https://nvd.nist.gov/vuln/detail/CVE-2026-63311
python3-nltk : CVE-2026-63312 : https://nvd.nist.gov/vuln/detail/CVE-2026-63312
python3-nltk : CVE-2026-65915 : https://nvd.nist.gov/vuln/detail/CVE-2026-65915
python3-nltk : CVE-2026-71514 : https://nvd.nist.gov/vuln/detail/CVE-2026-71514
python3-nltk : CVE-2026-72818 : https://nvd.nist.gov/vuln/detail/CVE-2026-72818
python3-nltk : CVE-2026-78680 : https://nvd.nist.gov/vuln/detail/CVE-2026-78680
python3-nltk : CVE-2026-78681 : https://nvd.nist.gov/vuln/detail/CVE-2026-78681
python3-nltk : CVE-2026-78682 : https://nvd.nist.gov/vuln/detail/CVE-2026-78682
python3-nltk : CVE-2026-78683 : https://nvd.nist.gov/vuln/detail/CVE-2026-78683
python3-nltk : CVE-2026-79657 : https://nvd.nist.gov/vuln/detail/CVE-2026-79657
python3-nltk : CVE-2026-79674 : https://nvd.nist.gov/vuln/detail/CVE-2026-79674
python3-nltk : CVE-2026-79675 : https://nvd.nist.gov/vuln/detail/CVE-2026-79675
python3-nltk : CVE-2026-79676 : https://nvd.nist.gov/vuln/detail/CVE-2026-79676
python3-nltk : CVE-2026-80205 : https://nvd.nist.gov/vuln/detail/CVE-2026-80205
python3-nltk : CVE-2026-80206 : https://nvd.nist.gov/vuln/detail/CVE-2026-80206
python3-nltk : CVE-2026-81722 : https://nvd.nist.gov/vuln/detail/CVE-2026-81722
python3-nltk : CVE-2026-81723 : https://nvd.nist.gov/vuln/detail/CVE-2026-81723
python3-nltk : CVE-2026-81724 : https://nvd.nist.gov/vuln/detail/CVE-2026-81724
python3-nltk : CVE-2026-81725 : https://nvd.nist.gov/vuln/detail/CVE-2026-81725
python3-nltk : CVE-2026-81726 : https://nvd.nist.gov/vuln/detail/CVE-2026-81726
python3-nltk : CVE-2026-81727 : https://nvd.nist.gov/vuln/detail/CVE-2026-81727
python3-paramiko : CVE-2026-44405 :
https://nvd.nist.gov/vuln/detail/CVE-2026-44405
python3-pillow : CVE-2026-54058 :
https://nvd.nist.gov/vuln/detail/CVE-2026-54058
python3-pillow : CVE-2026-54059 :
https://nvd.nist.gov/vuln/detail/CVE-2026-54059
python3-pillow : CVE-2026-54060 :
https://nvd.nist.gov/vuln/detail/CVE-2026-54060
python3-pillow : CVE-2026-55379 :
https://nvd.nist.gov/vuln/detail/CVE-2026-55379
python3-pillow : CVE-2026-55380 :
https://nvd.nist.gov/vuln/detail/CVE-2026-55380
python3-pillow : CVE-2026-55798 :
https://nvd.nist.gov/vuln/detail/CVE-2026-55798
python3-pillow : CVE-2026-59197 :
https://nvd.nist.gov/vuln/detail/CVE-2026-59197
python3-pillow : CVE-2026-59198 :
https://nvd.nist.gov/vuln/detail/CVE-2026-59198
python3-pillow : CVE-2026-59199 :
https://nvd.nist.gov/vuln/detail/CVE-2026-59199
python3-pillow : CVE-2026-59200 :
https://nvd.nist.gov/vuln/detail/CVE-2026-59200
python3-pillow : CVE-2026-59203 :
https://nvd.nist.gov/vuln/detail/CVE-2026-59203
python3-pillow : CVE-2026-59204 :
https://nvd.nist.gov/vuln/detail/CVE-2026-59204
python3-pillow : CVE-2026-59205 :
https://nvd.nist.gov/vuln/detail/CVE-2026-59205
python3-py7zr : CVE-2026-23879 : https://nvd.nist.gov/vuln/detail/CVE-2026-23879
python3-py7zr : CVE-2026-55195 : https://nvd.nist.gov/vuln/detail/CVE-2026-55195
python3-py7zr : CVE-2026-55206 : https://nvd.nist.gov/vuln/detail/CVE-2026-55206
python3-python-multipart : CVE-2024-53981 :
https://nvd.nist.gov/vuln/detail/CVE-2024-53981
python3-python-multipart : CVE-2026-42561 :
https://nvd.nist.gov/vuln/detail/CVE-2026-42561
python3-python-multipart : CVE-2026-53537 :
https://nvd.nist.gov/vuln/detail/CVE-2026-53537
python3-python-multipart : CVE-2026-53538 :
https://nvd.nist.gov/vuln/detail/CVE-2026-53538
python3-python-multipart : CVE-2026-53539 :
https://nvd.nist.gov/vuln/detail/CVE-2026-53539
python3-python-multipart : CVE-2026-53540 :
https://nvd.nist.gov/vuln/detail/CVE-2026-53540
python3-sqlparse : CVE-2026-54284 :
https://nvd.nist.gov/vuln/detail/CVE-2026-54284
python3-sqlparse : CVE-2026-59893 :
https://nvd.nist.gov/vuln/detail/CVE-2026-59893
python3-sqlparse : CVE-2026-59894 :
https://nvd.nist.gov/vuln/detail/CVE-2026-59894
python3-sqlparse : CVE-2026-71491 :
https://nvd.nist.gov/vuln/detail/CVE-2026-71491
python3-starlette : CVE-2024-47874 :
https://nvd.nist.gov/vuln/detail/CVE-2024-47874
python3-starlette : CVE-2025-54121 :
https://nvd.nist.gov/vuln/detail/CVE-2025-54121
python3-starlette : CVE-2025-62727 :
https://nvd.nist.gov/vuln/detail/CVE-2025-62727
python3-starlette : CVE-2026-48710 :
https://nvd.nist.gov/vuln/detail/CVE-2026-48710
python3-starlette : CVE-2026-48817 :
https://nvd.nist.gov/vuln/detail/CVE-2026-48817
python3-starlette : CVE-2026-48818 :
https://nvd.nist.gov/vuln/detail/CVE-2026-48818
python3-starlette : CVE-2026-54282 :
https://nvd.nist.gov/vuln/detail/CVE-2026-54282
python3-starlette : CVE-2026-54283 :
https://nvd.nist.gov/vuln/detail/CVE-2026-54283
python3-tornado : CVE-2026-49853 :
https://nvd.nist.gov/vuln/detail/CVE-2026-49853
python3-tornado : CVE-2026-49854 :
https://nvd.nist.gov/vuln/detail/CVE-2026-49854
python3-tornado : CVE-2026-49855 :
https://nvd.nist.gov/vuln/detail/CVE-2026-49855
python3-tqdm : CVE-2024-34062 : https://nvd.nist.gov/vuln/detail/CVE-2024-34062
python3-twisted : CVE-2024-41671 :
https://nvd.nist.gov/vuln/detail/CVE-2024-41671
python3-zeroconf : CVE-2026-48045 :
https://nvd.nist.gov/vuln/detail/CVE-2026-48045
python3-zeroconf : CVE-2026-48487 :
https://nvd.nist.gov/vuln/detail/CVE-2026-48487
rapidjson : CVE-2024-38517 : https://nvd.nist.gov/vuln/detail/CVE-2024-38517
rapidjson : CVE-2024-39684 : https://nvd.nist.gov/vuln/detail/CVE-2024-39684
redis : CVE-2026-23479 : https://nvd.nist.gov/vuln/detail/CVE-2026-23479
redis : CVE-2026-23631 : https://nvd.nist.gov/vuln/detail/CVE-2026-23631
redis : CVE-2026-25243 : https://nvd.nist.gov/vuln/detail/CVE-2026-25243
redis : CVE-2026-66373 : https://nvd.nist.gov/vuln/detail/CVE-2026-66373
rsyslog : CVE-2026-19654 : https://nvd.nist.gov/vuln/detail/CVE-2026-19654
sd : CVE-2015-2909 : https://nvd.nist.gov/vuln/detail/CVE-2015-2909
sd : CVE-2025-31700 : https://nvd.nist.gov/vuln/detail/CVE-2025-31700
sd : CVE-2025-31701 : https://nvd.nist.gov/vuln/detail/CVE-2025-31701
sd : CVE-2025-31702 : https://nvd.nist.gov/vuln/detail/CVE-2025-31702
smarty : CVE-2008-4811 : https://nvd.nist.gov/vuln/detail/CVE-2008-4811
smarty : CVE-2024-35226 : https://nvd.nist.gov/vuln/detail/CVE-2024-35226
smarty : CVE-2026-62992 : https://nvd.nist.gov/vuln/detail/CVE-2026-62992
smarty : CVE-2026-62996 : https://nvd.nist.gov/vuln/detail/CVE-2026-62996
squid : CVE-2026-47729 : https://nvd.nist.gov/vuln/detail/CVE-2026-47729
squid : CVE-2026-50012 : https://nvd.nist.gov/vuln/detail/CVE-2026-50012
sthttpd : CVE-2021-26843 : https://nvd.nist.gov/vuln/detail/CVE-2021-26843
stunnel : CVE-2026-70367 : https://nvd.nist.gov/vuln/detail/CVE-2026-70367
stunnel : CVE-2026-70368 : https://nvd.nist.gov/vuln/detail/CVE-2026-70368
syslog-ng : CVE-2026-39879 : https://nvd.nist.gov/vuln/detail/CVE-2026-39879
tesseract : CVE-2026-73066 : https://nvd.nist.gov/vuln/detail/CVE-2026-73066
tesseract : CVE-2026-73067 : https://nvd.nist.gov/vuln/detail/CVE-2026-73067
thrift : CVE-2025-48431 : https://nvd.nist.gov/vuln/detail/CVE-2025-48431
thrift : CVE-2026-41602 : https://nvd.nist.gov/vuln/detail/CVE-2026-41602
thrift : CVE-2026-41604 : https://nvd.nist.gov/vuln/detail/CVE-2026-41604
thrift : CVE-2026-41605 : https://nvd.nist.gov/vuln/detail/CVE-2026-41605
thrift : CVE-2026-41606 : https://nvd.nist.gov/vuln/detail/CVE-2026-41606
thrift : CVE-2026-41607 : https://nvd.nist.gov/vuln/detail/CVE-2026-41607
thrift : CVE-2026-41608 : https://nvd.nist.gov/vuln/detail/CVE-2026-41608
thrift : CVE-2026-41636 : https://nvd.nist.gov/vuln/detail/CVE-2026-41636
thrift : CVE-2026-43871 : https://nvd.nist.gov/vuln/detail/CVE-2026-43871
thrift : CVE-2026-45112 : https://nvd.nist.gov/vuln/detail/CVE-2026-45112
thrift : CVE-2026-48145 : https://nvd.nist.gov/vuln/detail/CVE-2026-48145
thrift : CVE-2026-48586 : https://nvd.nist.gov/vuln/detail/CVE-2026-48586
thrift : CVE-2026-49158 : https://nvd.nist.gov/vuln/detail/CVE-2026-49158
thrift : CVE-2026-55968 : https://nvd.nist.gov/vuln/detail/CVE-2026-55968
thrift : CVE-2026-55969 : https://nvd.nist.gov/vuln/detail/CVE-2026-55969
thrift : CVE-2026-55970 : https://nvd.nist.gov/vuln/detail/CVE-2026-55970
thrift : CVE-2026-58662 : https://nvd.nist.gov/vuln/detail/CVE-2026-58662
thrift : CVE-2026-66053 : https://nvd.nist.gov/vuln/detail/CVE-2026-66053
tinyproxy : CVE-2026-31842 : https://nvd.nist.gov/vuln/detail/CVE-2026-31842
tinyproxy : CVE-2026-54387 : https://nvd.nist.gov/vuln/detail/CVE-2026-54387
tinyproxy : CVE-2026-54388 : https://nvd.nist.gov/vuln/detail/CVE-2026-54388
tinyproxy : CVE-2026-55202 : https://nvd.nist.gov/vuln/detail/CVE-2026-55202
tmate : CVE-2026-4751 : https://nvd.nist.gov/vuln/detail/CVE-2026-4751
tmux : CVE-2026-11623 : https://nvd.nist.gov/vuln/detail/CVE-2026-11623
udisks2 : CVE-2026-7867 : https://nvd.nist.gov/vuln/detail/CVE-2026-7867
unbound : CVE-2026-14586 : https://nvd.nist.gov/vuln/detail/CVE-2026-14586
unbound : CVE-2026-32665 : https://nvd.nist.gov/vuln/detail/CVE-2026-32665
unbound : CVE-2026-32792 : https://nvd.nist.gov/vuln/detail/CVE-2026-32792
unbound : CVE-2026-33278 : https://nvd.nist.gov/vuln/detail/CVE-2026-33278
unbound : CVE-2026-40622 : https://nvd.nist.gov/vuln/detail/CVE-2026-40622
unbound : CVE-2026-40691 : https://nvd.nist.gov/vuln/detail/CVE-2026-40691
unbound : CVE-2026-41292 : https://nvd.nist.gov/vuln/detail/CVE-2026-41292
unbound : CVE-2026-41637 : https://nvd.nist.gov/vuln/detail/CVE-2026-41637
unbound : CVE-2026-42534 : https://nvd.nist.gov/vuln/detail/CVE-2026-42534
unbound : CVE-2026-42923 : https://nvd.nist.gov/vuln/detail/CVE-2026-42923
unbound : CVE-2026-42944 : https://nvd.nist.gov/vuln/detail/CVE-2026-42944
unbound : CVE-2026-42955 : https://nvd.nist.gov/vuln/detail/CVE-2026-42955
unbound : CVE-2026-42959 : https://nvd.nist.gov/vuln/detail/CVE-2026-42959
unbound : CVE-2026-42960 : https://nvd.nist.gov/vuln/detail/CVE-2026-42960
unbound : CVE-2026-44390 : https://nvd.nist.gov/vuln/detail/CVE-2026-44390
unbound : CVE-2026-44608 : https://nvd.nist.gov/vuln/detail/CVE-2026-44608
unbound : CVE-2026-44621 : https://nvd.nist.gov/vuln/detail/CVE-2026-44621
unbound : CVE-2026-44687 : https://nvd.nist.gov/vuln/detail/CVE-2026-44687
unbound : CVE-2026-44690 : https://nvd.nist.gov/vuln/detail/CVE-2026-44690
unbound : CVE-2026-46582 : https://nvd.nist.gov/vuln/detail/CVE-2026-46582
unbound : CVE-2026-50045 : https://nvd.nist.gov/vuln/detail/CVE-2026-50045
unbound : CVE-2026-50046 : https://nvd.nist.gov/vuln/detail/CVE-2026-50046
unbound : CVE-2026-50243 : https://nvd.nist.gov/vuln/detail/CVE-2026-50243
unbound : CVE-2026-50248 : https://nvd.nist.gov/vuln/detail/CVE-2026-50248
unbound : CVE-2026-50251 : https://nvd.nist.gov/vuln/detail/CVE-2026-50251
unbound : CVE-2026-50252 : https://nvd.nist.gov/vuln/detail/CVE-2026-50252
unbound : CVE-2026-54478 : https://nvd.nist.gov/vuln/detail/CVE-2026-54478
unbound : CVE-2026-55708 : https://nvd.nist.gov/vuln/detail/CVE-2026-55708
unbound : CVE-2026-55717 : https://nvd.nist.gov/vuln/detail/CVE-2026-55717
unbound : CVE-2026-55973 : https://nvd.nist.gov/vuln/detail/CVE-2026-55973
unbound : CVE-2026-55990 : https://nvd.nist.gov/vuln/detail/CVE-2026-55990
unbound : CVE-2026-55991 : https://nvd.nist.gov/vuln/detail/CVE-2026-55991
unbound : CVE-2026-56416 : https://nvd.nist.gov/vuln/detail/CVE-2026-56416
unbound : CVE-2026-56444 : https://nvd.nist.gov/vuln/detail/CVE-2026-56444
usbmuxd : CVE-2025-66004 : https://nvd.nist.gov/vuln/detail/CVE-2025-66004
vlc : CVE-2017-8311 : https://nvd.nist.gov/vuln/detail/CVE-2017-8311
vlc : CVE-2017-8312 : https://nvd.nist.gov/vuln/detail/CVE-2017-8312
vlc : CVE-2017-8313 : https://nvd.nist.gov/vuln/detail/CVE-2017-8313
webkitgtk3 : CVE-2026-78376 : https://nvd.nist.gov/vuln/detail/CVE-2026-78376
webmin : CVE-2026-22678 : https://nvd.nist.gov/vuln/detail/CVE-2026-22678
webmin : CVE-2026-42210 : https://nvd.nist.gov/vuln/detail/CVE-2026-42210
webmin : CVE-2026-49102 : https://nvd.nist.gov/vuln/detail/CVE-2026-49102
webmin : CVE-2026-49103 : https://nvd.nist.gov/vuln/detail/CVE-2026-49103
webmin : CVE-2026-56022 : https://nvd.nist.gov/vuln/detail/CVE-2026-56022
weechat : CVE-2026-53524 : https://nvd.nist.gov/vuln/detail/CVE-2026-53524
weechat : CVE-2026-53525 : https://nvd.nist.gov/vuln/detail/CVE-2026-53525
wireshark : CVE-2026-15163 : https://nvd.nist.gov/vuln/detail/CVE-2026-15163
wireshark : CVE-2026-15164 : https://nvd.nist.gov/vuln/detail/CVE-2026-15164
wireshark : CVE-2026-15165 : https://nvd.nist.gov/vuln/detail/CVE-2026-15165
wireshark : CVE-2026-15166 : https://nvd.nist.gov/vuln/detail/CVE-2026-15166
wireshark : CVE-2026-15167 : https://nvd.nist.gov/vuln/detail/CVE-2026-15167
wireshark : CVE-2026-15168 : https://nvd.nist.gov/vuln/detail/CVE-2026-15168
wireshark : CVE-2026-15169 : https://nvd.nist.gov/vuln/detail/CVE-2026-15169
wireshark : CVE-2026-15170 : https://nvd.nist.gov/vuln/detail/CVE-2026-15170
wireshark : CVE-2026-15171 : https://nvd.nist.gov/vuln/detail/CVE-2026-15171
wireshark : CVE-2026-15172 : https://nvd.nist.gov/vuln/detail/CVE-2026-15172
wireshark : CVE-2026-15173 : https://nvd.nist.gov/vuln/detail/CVE-2026-15173
wireshark : CVE-2026-15174 : https://nvd.nist.gov/vuln/detail/CVE-2026-15174
wireshark : CVE-2026-19694 : https://nvd.nist.gov/vuln/detail/CVE-2026-19694
wireshark : CVE-2026-19695 : https://nvd.nist.gov/vuln/detail/CVE-2026-19695
wireshark : CVE-2026-19696 : https://nvd.nist.gov/vuln/detail/CVE-2026-19696
wireshark : CVE-2026-5299 : https://nvd.nist.gov/vuln/detail/CVE-2026-5299
wireshark : CVE-2026-5401 : https://nvd.nist.gov/vuln/detail/CVE-2026-5401
wireshark : CVE-2026-5402 : https://nvd.nist.gov/vuln/detail/CVE-2026-5402
wireshark : CVE-2026-5403 : https://nvd.nist.gov/vuln/detail/CVE-2026-5403
wireshark : CVE-2026-5404 : https://nvd.nist.gov/vuln/detail/CVE-2026-5404
wireshark : CVE-2026-5405 : https://nvd.nist.gov/vuln/detail/CVE-2026-5405
wireshark : CVE-2026-5406 : https://nvd.nist.gov/vuln/detail/CVE-2026-5406
wireshark : CVE-2026-5407 : https://nvd.nist.gov/vuln/detail/CVE-2026-5407
wireshark : CVE-2026-5408 : https://nvd.nist.gov/vuln/detail/CVE-2026-5408
wireshark : CVE-2026-5409 : https://nvd.nist.gov/vuln/detail/CVE-2026-5409
wireshark : CVE-2026-5653 : https://nvd.nist.gov/vuln/detail/CVE-2026-5653
wireshark : CVE-2026-5654 : https://nvd.nist.gov/vuln/detail/CVE-2026-5654
wireshark : CVE-2026-5655 : https://nvd.nist.gov/vuln/detail/CVE-2026-5655
wireshark : CVE-2026-5656 : https://nvd.nist.gov/vuln/detail/CVE-2026-5656
wireshark : CVE-2026-5657 : https://nvd.nist.gov/vuln/detail/CVE-2026-5657
wireshark : CVE-2026-6519 : https://nvd.nist.gov/vuln/detail/CVE-2026-6519
wireshark : CVE-2026-6520 : https://nvd.nist.gov/vuln/detail/CVE-2026-6520
wireshark : CVE-2026-6521 : https://nvd.nist.gov/vuln/detail/CVE-2026-6521
wireshark : CVE-2026-6522 : https://nvd.nist.gov/vuln/detail/CVE-2026-6522
wireshark : CVE-2026-6523 : https://nvd.nist.gov/vuln/detail/CVE-2026-6523
wireshark : CVE-2026-6524 : https://nvd.nist.gov/vuln/detail/CVE-2026-6524
wireshark : CVE-2026-6525 : https://nvd.nist.gov/vuln/detail/CVE-2026-6525
wireshark : CVE-2026-6526 : https://nvd.nist.gov/vuln/detail/CVE-2026-6526
wireshark : CVE-2026-6527 : https://nvd.nist.gov/vuln/detail/CVE-2026-6527
wireshark : CVE-2026-6528 : https://nvd.nist.gov/vuln/detail/CVE-2026-6528
wireshark : CVE-2026-6529 : https://nvd.nist.gov/vuln/detail/CVE-2026-6529
wireshark : CVE-2026-6530 : https://nvd.nist.gov/vuln/detail/CVE-2026-6530
wireshark : CVE-2026-6531 : https://nvd.nist.gov/vuln/detail/CVE-2026-6531
wireshark : CVE-2026-6532 : https://nvd.nist.gov/vuln/detail/CVE-2026-6532
wireshark : CVE-2026-6533 : https://nvd.nist.gov/vuln/detail/CVE-2026-6533
wireshark : CVE-2026-6534 : https://nvd.nist.gov/vuln/detail/CVE-2026-6534
wireshark : CVE-2026-6535 : https://nvd.nist.gov/vuln/detail/CVE-2026-6535
wireshark : CVE-2026-6536 : https://nvd.nist.gov/vuln/detail/CVE-2026-6536
wireshark : CVE-2026-6537 : https://nvd.nist.gov/vuln/detail/CVE-2026-6537
wireshark : CVE-2026-6538 : https://nvd.nist.gov/vuln/detail/CVE-2026-6538
wireshark : CVE-2026-6867 : https://nvd.nist.gov/vuln/detail/CVE-2026-6867
wireshark : CVE-2026-6868 : https://nvd.nist.gov/vuln/detail/CVE-2026-6868
wireshark : CVE-2026-6869 : https://nvd.nist.gov/vuln/detail/CVE-2026-6869
wireshark : CVE-2026-6870 : https://nvd.nist.gov/vuln/detail/CVE-2026-6870
wireshark : CVE-2026-7375 : https://nvd.nist.gov/vuln/detail/CVE-2026-7375
wireshark : CVE-2026-7376 : https://nvd.nist.gov/vuln/detail/CVE-2026-7376
wireshark : CVE-2026-7378 : https://nvd.nist.gov/vuln/detail/CVE-2026-7378
wireshark : CVE-2026-7379 : https://nvd.nist.gov/vuln/detail/CVE-2026-7379
wireshark : CVE-2026-76879 : https://nvd.nist.gov/vuln/detail/CVE-2026-76879
wireshark : CVE-2026-76880 : https://nvd.nist.gov/vuln/detail/CVE-2026-76880
wireshark : CVE-2026-76881 : https://nvd.nist.gov/vuln/detail/CVE-2026-76881
wireshark : CVE-2026-76882 : https://nvd.nist.gov/vuln/detail/CVE-2026-76882
wireshark : CVE-2026-76883 : https://nvd.nist.gov/vuln/detail/CVE-2026-76883
wireshark : CVE-2026-76884 : https://nvd.nist.gov/vuln/detail/CVE-2026-76884
wireshark : CVE-2026-76885 : https://nvd.nist.gov/vuln/detail/CVE-2026-76885
wireshark : CVE-2026-76886 : https://nvd.nist.gov/vuln/detail/CVE-2026-76886
wireshark : CVE-2026-76887 : https://nvd.nist.gov/vuln/detail/CVE-2026-76887
wireshark : CVE-2026-76888 : https://nvd.nist.gov/vuln/detail/CVE-2026-76888
wireshark : CVE-2026-76889 : https://nvd.nist.gov/vuln/detail/CVE-2026-76889
wireshark : CVE-2026-76890 : https://nvd.nist.gov/vuln/detail/CVE-2026-76890
wireshark : CVE-2026-76891 : https://nvd.nist.gov/vuln/detail/CVE-2026-76891
wireshark : CVE-2026-76917 : https://nvd.nist.gov/vuln/detail/CVE-2026-76917
wireshark : CVE-2026-76918 : https://nvd.nist.gov/vuln/detail/CVE-2026-76918
wireshark : CVE-2026-76919 : https://nvd.nist.gov/vuln/detail/CVE-2026-76919
wireshark : CVE-2026-76920 : https://nvd.nist.gov/vuln/detail/CVE-2026-76920
wireshark : CVE-2026-76921 : https://nvd.nist.gov/vuln/detail/CVE-2026-76921
wireshark : CVE-2026-76922 : https://nvd.nist.gov/vuln/detail/CVE-2026-76922
wireshark : CVE-2026-76923 : https://nvd.nist.gov/vuln/detail/CVE-2026-76923
wireshark : CVE-2026-76924 : https://nvd.nist.gov/vuln/detail/CVE-2026-76924
wireshark : CVE-2026-76926 : https://nvd.nist.gov/vuln/detail/CVE-2026-76926
wireshark : CVE-2026-76927 : https://nvd.nist.gov/vuln/detail/CVE-2026-76927
wireshark : CVE-2026-76928 : https://nvd.nist.gov/vuln/detail/CVE-2026-76928
wireshark : CVE-2026-76929 : https://nvd.nist.gov/vuln/detail/CVE-2026-76929
wireshark : CVE-2026-9759 : https://nvd.nist.gov/vuln/detail/CVE-2026-9759
wolfssl : CVE-2023-6937 : https://nvd.nist.gov/vuln/detail/CVE-2023-6937
wolfssl : CVE-2024-5814 : https://nvd.nist.gov/vuln/detail/CVE-2024-5814
wolfssl : CVE-2026-10097 : https://nvd.nist.gov/vuln/detail/CVE-2026-10097
wolfssl : CVE-2026-10098 : https://nvd.nist.gov/vuln/detail/CVE-2026-10098
wolfssl : CVE-2026-10512 : https://nvd.nist.gov/vuln/detail/CVE-2026-10512
wolfssl : CVE-2026-10592 : https://nvd.nist.gov/vuln/detail/CVE-2026-10592
wolfssl : CVE-2026-11310 : https://nvd.nist.gov/vuln/detail/CVE-2026-11310
wolfssl : CVE-2026-11703 : https://nvd.nist.gov/vuln/detail/CVE-2026-11703
wolfssl : CVE-2026-11999 : https://nvd.nist.gov/vuln/detail/CVE-2026-11999
wolfssl : CVE-2026-12340 : https://nvd.nist.gov/vuln/detail/CVE-2026-12340
wolfssl : CVE-2026-55958 : https://nvd.nist.gov/vuln/detail/CVE-2026-55958
wolfssl : CVE-2026-55960 : https://nvd.nist.gov/vuln/detail/CVE-2026-55960
wolfssl : CVE-2026-55961 : https://nvd.nist.gov/vuln/detail/CVE-2026-55961
wolfssl : CVE-2026-55962 : https://nvd.nist.gov/vuln/detail/CVE-2026-55962
wolfssl : CVE-2026-55964 : https://nvd.nist.gov/vuln/detail/CVE-2026-55964
wolfssl : CVE-2026-55967 : https://nvd.nist.gov/vuln/detail/CVE-2026-55967
wolfssl : CVE-2026-6091 : https://nvd.nist.gov/vuln/detail/CVE-2026-6091
wolfssl : CVE-2026-6092 : https://nvd.nist.gov/vuln/detail/CVE-2026-6092
wolfssl : CVE-2026-6094 : https://nvd.nist.gov/vuln/detail/CVE-2026-6094
wolfssl : CVE-2026-6291 : https://nvd.nist.gov/vuln/detail/CVE-2026-6291
wolfssl : CVE-2026-6325 : https://nvd.nist.gov/vuln/detail/CVE-2026-6325
wolfssl : CVE-2026-6329 : https://nvd.nist.gov/vuln/detail/CVE-2026-6329
wolfssl : CVE-2026-6330 : https://nvd.nist.gov/vuln/detail/CVE-2026-6330
wolfssl : CVE-2026-6331 : https://nvd.nist.gov/vuln/detail/CVE-2026-6331
wolfssl : CVE-2026-6412 : https://nvd.nist.gov/vuln/detail/CVE-2026-6412
wolfssl : CVE-2026-6450 : https://nvd.nist.gov/vuln/detail/CVE-2026-6450
wolfssl : CVE-2026-6678 : https://nvd.nist.gov/vuln/detail/CVE-2026-6678
wolfssl : CVE-2026-6731 : https://nvd.nist.gov/vuln/detail/CVE-2026-6731
wolfssl : CVE-2026-7511 : https://nvd.nist.gov/vuln/detail/CVE-2026-7511
wolfssl : CVE-2026-7531 : https://nvd.nist.gov/vuln/detail/CVE-2026-7531
wolfssl : CVE-2026-7532 : https://nvd.nist.gov/vuln/detail/CVE-2026-7532
wolfssl : CVE-2026-8720 : https://nvd.nist.gov/vuln/detail/CVE-2026-8720
xerces-c : CVE-2012-0880 : https://nvd.nist.gov/vuln/detail/CVE-2012-0880
xmlrpc-c : CVE-2026-15928 : https://nvd.nist.gov/vuln/detail/CVE-2026-15928
xterm : CVE-2006-7236 : https://nvd.nist.gov/vuln/detail/CVE-2006-7236
xterm : CVE-2008-2383 : https://nvd.nist.gov/vuln/detail/CVE-2008-2383
zabbix : CVE-2023-29453 : https://nvd.nist.gov/vuln/detail/CVE-2023-29453
zabbix : CVE-2023-29454 : https://nvd.nist.gov/vuln/detail/CVE-2023-29454
zabbix : CVE-2023-29455 : https://nvd.nist.gov/vuln/detail/CVE-2023-29455
zabbix : CVE-2023-29456 : https://nvd.nist.gov/vuln/detail/CVE-2023-29456
zabbix : CVE-2023-29457 : https://nvd.nist.gov/vuln/detail/CVE-2023-29457
zabbix : CVE-2023-32725 : https://nvd.nist.gov/vuln/detail/CVE-2023-32725
zabbix : CVE-2023-32726 : https://nvd.nist.gov/vuln/detail/CVE-2023-32726
zabbix : CVE-2023-32727 : https://nvd.nist.gov/vuln/detail/CVE-2023-32727
zabbix : CVE-2023-32728 : https://nvd.nist.gov/vuln/detail/CVE-2023-32728
zabbix : CVE-2025-27232 : https://nvd.nist.gov/vuln/detail/CVE-2025-27232
zabbix : CVE-2025-27233 : https://nvd.nist.gov/vuln/detail/CVE-2025-27233
zabbix : CVE-2025-27234 : https://nvd.nist.gov/vuln/detail/CVE-2025-27234
zabbix : CVE-2025-27237 : https://nvd.nist.gov/vuln/detail/CVE-2025-27237
zabbix : CVE-2025-49642 : https://nvd.nist.gov/vuln/detail/CVE-2025-49642
zabbix : CVE-2025-49643 : https://nvd.nist.gov/vuln/detail/CVE-2025-49643
zabbix : CVE-2026-1199 : https://nvd.nist.gov/vuln/detail/CVE-2026-1199
zabbix : CVE-2026-23922 : https://nvd.nist.gov/vuln/detail/CVE-2026-23922
zabbix : CVE-2026-23924 : https://nvd.nist.gov/vuln/detail/CVE-2026-23924
zabbix : CVE-2026-23926 : https://nvd.nist.gov/vuln/detail/CVE-2026-23926
zabbix : CVE-2026-23927 : https://nvd.nist.gov/vuln/detail/CVE-2026-23927
zabbix : CVE-2026-23928 : https://nvd.nist.gov/vuln/detail/CVE-2026-23928
zabbix : CVE-2026-23929 : https://nvd.nist.gov/vuln/detail/CVE-2026-23929
zabbix : CVE-2026-23930 : https://nvd.nist.gov/vuln/detail/CVE-2026-23930
zabbix : CVE-2026-23931 : https://nvd.nist.gov/vuln/detail/CVE-2026-23931
zabbix : CVE-2026-23933 : https://nvd.nist.gov/vuln/detail/CVE-2026-23933
zabbix : CVE-2026-23934 : https://nvd.nist.gov/vuln/detail/CVE-2026-23934
zabbix : CVE-2026-23935 : https://nvd.nist.gov/vuln/detail/CVE-2026-23935
zabbix : CVE-2026-23937 : https://nvd.nist.gov/vuln/detail/CVE-2026-23937
zabbix : CVE-2026-23938 : https://nvd.nist.gov/vuln/detail/CVE-2026-23938
zabbix : CVE-2026-59781 : https://nvd.nist.gov/vuln/detail/CVE-2026-59781

cheers
Ankur

