Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15774C982ED
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 20:31:14 +0000 (UTC)
Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6163.1790022670492844380
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 13:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YqMJlmCN;
 spf=pass (domain: gmail.com, ip: 74.125.227.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396cccbba92so3079875a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 13:31:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790022670; cv=none;
        d=google.com; s=arc-20260327;
        b=qgAgZVESZpGJUUVbFqcS03al+cI8VDK16L6UGbLSjDlxUr3kJrbjmSdrcFTmEMh6MU
         +i2eAloDhxNh8WIERt1qQg0XmYfto8cjcYJ7SvOVNWXdPfA+a138StvEYIVXCX0Slaq8
         h5o8e/rdXZ/wSd6PZvaG38T+7OmmAiI25HeNQxkn3yczBxtx5KPqllY1449rWbz+ykB9
         /MMNz0OuEEymqFTBZOP/jvCkKiE1lHOEPDs0SH5yF+GWwBD55+uSEXZFH+s0pCdry/sD
         VTv3r+f6sZ9E8KNinE1EPcBRNO0Aykpe4kIlQJV7DpfTD5jc+RNdgxAWu6PMWLxfkO3l
         mI2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=BSOtTy2LzZcJL2tqBJcdRbrgWDqvCGWCpSvJgGx58Tc=;
        fh=Sz9EADBpfrCLv6q7U9ZBEUz0nl2QuAmXc1tGoo1tqCI=;
        b=WeqQjjHKYV30/m4/yB7l5dBNYnxSix0qdty2IUIP7Ij8RNNsUIDrZm/oyNyPEXHIz2
         fnYEX0T9ppYhlOQ9IafwiE5KZARI/coQKGaH8fYE7sEZ0aRDcVip8QrTEzB3UprXwhS7
         piqUAuuXM3AhtS5QrgCXBSbJxFj3UuzoNfnU53NFTeB+aBKDOWkVbpJkmwd5IGn6Ge5V
         1FA43HIAgbnuRmWm3m70nJRbbU2CfiJOUA3HeAgUQQgzrCUbKABlWJhKpguX3532u+8i
         z1jH2+83B/zNvhf9vJsPePbDe74U497ve1GQASM4SFeZAJzS3CsOwRENGrwUEB5CMIwK
         uKrQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790022670; x=1790627470; darn=lists.openembedded.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BSOtTy2LzZcJL2tqBJcdRbrgWDqvCGWCpSvJgGx58Tc=;
        b=YqMJlmCNdglcSWdM+fwh2WYQnyc134iZiwn4kNXq/MV6EeFn9JjEZ3AQvG/AHjNPFI
         WEa+bwJqItV2CZJ7sHOGZ3U+j4NJtwGYP6W6ZApbuOLSg2YjpV5NUiBeSMFgjtspllGF
         kI8FX1zcC4AM1okYAWFxINBQzpdwwVEouvqJVBZsxwNZRa78ow7fs7HSKSHor7jKTyhf
         +rquMGQwvsPlcAdfgIu5QM3P4h11S+eIG23P69yMQ3wx4/X9wKWlaxFSpxhYX+c52ObK
         vlVoGN0j7L9e3PG3vUsbMPRnzTov1nBnYd1YhBPSy9yP6aQFE27y1pNlmGaQbFALg3Um
         hCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790022670; x=1790627470;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BSOtTy2LzZcJL2tqBJcdRbrgWDqvCGWCpSvJgGx58Tc=;
        b=aWvKn9A5O2HVdto/ys13sb+MgWWbZPDzwviY7PQZjRnoRDBhq44mn2CWkI+MnRSyJi
         EXVrXZhETcae90h+pssMcfWyuZdQ8uBSTD0YAa3KiFrR/L3mufqvqkn3L03HbmUa4gnw
         d7jWoCzN0ZDcVC4JG/mllEmBgNv4HwyLvcX44nMqMcyvDdtvvZ5/aSoKY7j2PECRtBVi
         +Q+Mjp7PumAqLCuJGT8x1mNdbvYkHPubcVxWCXIcUU7yrwa5pwL6/z6NCdpzL3FP3rGp
         u9FYj/QQeR/85hr2rMjY50gfZ0J+ZcdIqMkq6h4GMKqT90zU7YqbUGS5w2DZdiFJ0rAu
         r3sA==
X-Gm-Message-State: AFuF++nCIhy1Xy9vsmf+OGfVsDNVc/3q5Pnb4VhSZDmCihnQ9i5Z9OCz
	iy2xXrS2IC6cLdxg4LNDwD5nMu3clNDvvdqNTz8VWdPncgZPltLGNgMvY9gbc1wjxr1yRXc8OVu
	8coE/WIZpWOZ/qgwSLvT0ZdXIRCwN0vq4BhIX
X-Gm-Gg: AYBFou3VzNx0GvuwkKWdysEq9J6VctIv5TGE2KQyxkaQB+9kck7j6RbnISQpLypFD9b
	XKMftS/Sd7RYG5aiSvT71/U/QClva8EP2le1thjogK9fF6PyL3wtZI9V0ikovrUlAyf8y+PkDLB
	eImO0N2WP1ljiE++wJC/1titfyqq08W/7nnR9XfIPfNh8JmiYKG5K9u/rLXN7GpkbioJMEAqxd4
	0uCMqrwS/5cfjyGDzYHdTuaj8c3tzN7zSymKlFoKWnDJHly3lLq4j/l5nW5CZ43b6xProVxEscd
	jP55obAzTwbXgOLebBrm4iPQ8qAGsZDHHHpTelx1oRDazIaoc5FXHpeJY/iQJVzrhItwR36fRym
	YpOr2
X-Received: by 2002:a17:90a:1188:b0:39e:5b3c:4633 with SMTP id
 98e67ed59e1d1-39e5b3c4de4mr9315400a91.21.1790022669052; Mon, 21 Sep 2026
 13:31:09 -0700 (PDT)
MIME-Version: 1.0
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 22 Sep 2026 08:30:56 +1200
X-Gm-Features: AcwNN1W1tATw9CHK4cxkDG_Mn4GSQuJM8965AEDoOQw078jk1QNg_uzL5kS9cMA
Message-ID: <CADySD0EpPG97Oq5hfjNU1AAjkjCtxzPWEp6m7ro_YdLXmrYcxA@mail.gmail.com>
Subject: [meta-oe] CVE report wrynose 21 Sep 2026
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 20:31:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130168

7zip : CVE-2026-14266 : https://nvd.nist.gov/vuln/detail/CVE-2026-14266
7zip : CVE-2026-48092 : https://nvd.nist.gov/vuln/detail/CVE-2026-48092
7zip : CVE-2026-48095 : https://nvd.nist.gov/vuln/detail/CVE-2026-48095
7zip : CVE-2026-48101 : https://nvd.nist.gov/vuln/detail/CVE-2026-48101
7zip : CVE-2026-48102 : https://nvd.nist.gov/vuln/detail/CVE-2026-48102
7zip : CVE-2026-48103 : https://nvd.nist.gov/vuln/detail/CVE-2026-48103
7zip : CVE-2026-48104 : https://nvd.nist.gov/vuln/detail/CVE-2026-48104
7zip : CVE-2026-48111 : https://nvd.nist.gov/vuln/detail/CVE-2026-48111
7zip : CVE-2026-48112 : https://nvd.nist.gov/vuln/detail/CVE-2026-48112
botan : CVE-2024-34702 : https://nvd.nist.gov/vuln/detail/CVE-2024-34702
botan : CVE-2024-34703 : https://nvd.nist.gov/vuln/detail/CVE-2024-34703
botan : CVE-2026-44378 : https://nvd.nist.gov/vuln/detail/CVE-2026-44378
c-ares : CVE-2026-33630 : https://nvd.nist.gov/vuln/detail/CVE-2026-33630
c-ares : CVE-2026-69184 : https://nvd.nist.gov/vuln/detail/CVE-2026-69184
c-ares : CVE-2026-69186 : https://nvd.nist.gov/vuln/detail/CVE-2026-69186
cfengine : CVE-2026-24710 : https://nvd.nist.gov/vuln/detail/CVE-2026-24710
cfengine : CVE-2026-24711 : https://nvd.nist.gov/vuln/detail/CVE-2026-24711
cfengine : CVE-2026-24712 : https://nvd.nist.gov/vuln/detail/CVE-2026-24712
civetweb : CVE-2026-29035 : https://nvd.nist.gov/vuln/detail/CVE-2026-29035
cjose : CVE-2026-53938 : https://nvd.nist.gov/vuln/detail/CVE-2026-53938
cjose : CVE-2026-53939 : https://nvd.nist.gov/vuln/detail/CVE-2026-53939
cjson : CVE-2026-16554 : https://nvd.nist.gov/vuln/detail/CVE-2026-16554
cjson : CVE-2026-29036 : https://nvd.nist.gov/vuln/detail/CVE-2026-29036
cjson : CVE-2026-67215 : https://nvd.nist.gov/vuln/detail/CVE-2026-67215
cjson : CVE-2026-67216 : https://nvd.nist.gov/vuln/detail/CVE-2026-67216
cjson : CVE-2026-67217 : https://nvd.nist.gov/vuln/detail/CVE-2026-67217
cjson : CVE-2026-87933 : https://nvd.nist.gov/vuln/detail/CVE-2026-87933
colord : CVE-2026-85062 : https://nvd.nist.gov/vuln/detail/CVE-2026-85062
dhrystone : CVE-2020-23026 : https://nvd.nist.gov/vuln/detail/CVE-2020-23026
dlt-daemon : CVE-2021-29507 : https://nvd.nist.gov/vuln/detail/CVE-2021-29507
emacs : CVE-2026-6861 : https://nvd.nist.gov/vuln/detail/CVE-2026-6861
emacs : CVE-2026-71391 : https://nvd.nist.gov/vuln/detail/CVE-2026-71391
emacs : CVE-2026-71392 : https://nvd.nist.gov/vuln/detail/CVE-2026-71392
emacs : CVE-2026-71393 : https://nvd.nist.gov/vuln/detail/CVE-2026-71393
emacs : CVE-2026-71394 : https://nvd.nist.gov/vuln/detail/CVE-2026-71394
emacs : CVE-2026-77219 : https://nvd.nist.gov/vuln/detail/CVE-2026-77219
flatcc : CVE-2026-90784 : https://nvd.nist.gov/vuln/detail/CVE-2026-90784
flatcc : CVE-2026-90785 : https://nvd.nist.gov/vuln/detail/CVE-2026-90785
flatcc : CVE-2026-90786 : https://nvd.nist.gov/vuln/detail/CVE-2026-90786
flatpak : CVE-2026-90616 : https://nvd.nist.gov/vuln/detail/CVE-2026-90616
fluidsynth : CVE-2026-58264 : https://nvd.nist.gov/vuln/detail/CVE-2026-58264
fluidsynth : CVE-2026-61714 : https://nvd.nist.gov/vuln/detail/CVE-2026-61714
fluidsynth : CVE-2026-61720 : https://nvd.nist.gov/vuln/detail/CVE-2026-61720
fluidsynth : CVE-2026-61721 : https://nvd.nist.gov/vuln/detail/CVE-2026-61721
fluidsynth : CVE-2026-61722 : https://nvd.nist.gov/vuln/detail/CVE-2026-61722
fluidsynth : CVE-2026-61723 : https://nvd.nist.gov/vuln/detail/CVE-2026-61723
fontforge : CVE-2025-15276 : https://nvd.nist.gov/vuln/detail/CVE-2025-15276
fontforge : CVE-2025-15277 : https://nvd.nist.gov/vuln/detail/CVE-2025-15277
fontforge : CVE-2025-15278 : https://nvd.nist.gov/vuln/detail/CVE-2025-15278
freeipmi : CVE-2026-85504 : https://nvd.nist.gov/vuln/detail/CVE-2026-85504
freeipmi : CVE-2026-85505 : https://nvd.nist.gov/vuln/detail/CVE-2026-85505
freeipmi : CVE-2026-85506 : https://nvd.nist.gov/vuln/detail/CVE-2026-85506
freeipmi : CVE-2026-85507 : https://nvd.nist.gov/vuln/detail/CVE-2026-85507
freeipmi : CVE-2026-85508 : https://nvd.nist.gov/vuln/detail/CVE-2026-85508
freeipmi : CVE-2026-85509 : https://nvd.nist.gov/vuln/detail/CVE-2026-85509
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
freerdp : CVE-2026-85090 : https://nvd.nist.gov/vuln/detail/CVE-2026-85090
freerdp : CVE-2026-91946 : https://nvd.nist.gov/vuln/detail/CVE-2026-91946
freerdp : CVE-2026-91947 : https://nvd.nist.gov/vuln/detail/CVE-2026-91947
freerdp : CVE-2026-91950 : https://nvd.nist.gov/vuln/detail/CVE-2026-91950
freerdp : CVE-2026-91952 : https://nvd.nist.gov/vuln/detail/CVE-2026-91952
freerdp : CVE-2026-91953 : https://nvd.nist.gov/vuln/detail/CVE-2026-91953
freerdp : CVE-2026-91954 : https://nvd.nist.gov/vuln/detail/CVE-2026-91954
freerdp : CVE-2026-91955 : https://nvd.nist.gov/vuln/detail/CVE-2026-91955
freerdp : CVE-2026-91956 : https://nvd.nist.gov/vuln/detail/CVE-2026-91956
freerdp : CVE-2026-91957 : https://nvd.nist.gov/vuln/detail/CVE-2026-91957
freerdp : CVE-2026-91959 : https://nvd.nist.gov/vuln/detail/CVE-2026-91959
freerdp : CVE-2026-91960 : https://nvd.nist.gov/vuln/detail/CVE-2026-91960
freerdp : CVE-2026-91961 : https://nvd.nist.gov/vuln/detail/CVE-2026-91961
freerdp : CVE-2026-91962 : https://nvd.nist.gov/vuln/detail/CVE-2026-91962
freerdp : CVE-2026-91963 : https://nvd.nist.gov/vuln/detail/CVE-2026-91963
freerdp : CVE-2026-91964 : https://nvd.nist.gov/vuln/detail/CVE-2026-91964
freerdp3 : CVE-2026-40033 : https://nvd.nist.gov/vuln/detail/CVE-2026-40033
freerdp3 : CVE-2026-44420 : https://nvd.nist.gov/vuln/detail/CVE-2026-44420
freerdp3 : CVE-2026-44421 : https://nvd.nist.gov/vuln/detail/CVE-2026-44421
freerdp3 : CVE-2026-44422 : https://nvd.nist.gov/vuln/detail/CVE-2026-44422
freerdp3 : CVE-2026-45700 : https://nvd.nist.gov/vuln/detail/CVE-2026-45700
freerdp3 : CVE-2026-55827 : https://nvd.nist.gov/vuln/detail/CVE-2026-55827
freerdp3 : CVE-2026-57156 : https://nvd.nist.gov/vuln/detail/CVE-2026-57156
freerdp3 : CVE-2026-57157 : https://nvd.nist.gov/vuln/detail/CVE-2026-57157
freerdp3 : CVE-2026-57158 : https://nvd.nist.gov/vuln/detail/CVE-2026-57158
freerdp3 : CVE-2026-63117 : https://nvd.nist.gov/vuln/detail/CVE-2026-63117
freerdp3 : CVE-2026-64624 : https://nvd.nist.gov/vuln/detail/CVE-2026-64624
freerdp3 : CVE-2026-66402 : https://nvd.nist.gov/vuln/detail/CVE-2026-66402
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
freerdp3 : CVE-2026-85089 : https://nvd.nist.gov/vuln/detail/CVE-2026-85089
freerdp3 : CVE-2026-85090 : https://nvd.nist.gov/vuln/detail/CVE-2026-85090
freerdp3 : CVE-2026-91946 : https://nvd.nist.gov/vuln/detail/CVE-2026-91946
freerdp3 : CVE-2026-91947 : https://nvd.nist.gov/vuln/detail/CVE-2026-91947
freerdp3 : CVE-2026-91949 : https://nvd.nist.gov/vuln/detail/CVE-2026-91949
freerdp3 : CVE-2026-91950 : https://nvd.nist.gov/vuln/detail/CVE-2026-91950
freerdp3 : CVE-2026-91951 : https://nvd.nist.gov/vuln/detail/CVE-2026-91951
freerdp3 : CVE-2026-91952 : https://nvd.nist.gov/vuln/detail/CVE-2026-91952
freerdp3 : CVE-2026-91953 : https://nvd.nist.gov/vuln/detail/CVE-2026-91953
freerdp3 : CVE-2026-91954 : https://nvd.nist.gov/vuln/detail/CVE-2026-91954
freerdp3 : CVE-2026-91955 : https://nvd.nist.gov/vuln/detail/CVE-2026-91955
freerdp3 : CVE-2026-91956 : https://nvd.nist.gov/vuln/detail/CVE-2026-91956
freerdp3 : CVE-2026-91957 : https://nvd.nist.gov/vuln/detail/CVE-2026-91957
freerdp3 : CVE-2026-91958 : https://nvd.nist.gov/vuln/detail/CVE-2026-91958
freerdp3 : CVE-2026-91959 : https://nvd.nist.gov/vuln/detail/CVE-2026-91959
freerdp3 : CVE-2026-91960 : https://nvd.nist.gov/vuln/detail/CVE-2026-91960
freerdp3 : CVE-2026-91961 : https://nvd.nist.gov/vuln/detail/CVE-2026-91961
freerdp3 : CVE-2026-91962 : https://nvd.nist.gov/vuln/detail/CVE-2026-91962
freerdp3 : CVE-2026-91963 : https://nvd.nist.gov/vuln/detail/CVE-2026-91963
freerdp3 : CVE-2026-91964 : https://nvd.nist.gov/vuln/detail/CVE-2026-91964
gnuplot : CVE-2025-31181 : https://nvd.nist.gov/vuln/detail/CVE-2025-31181
gnuplot : CVE-2025-3359 : https://nvd.nist.gov/vuln/detail/CVE-2025-3359
gpsd : CVE-2026-60122 : https://nvd.nist.gov/vuln/detail/CVE-2026-60122
hdf5 : CVE-2026-19023 : https://nvd.nist.gov/vuln/detail/CVE-2026-19023
hdf5 : CVE-2026-19024 : https://nvd.nist.gov/vuln/detail/CVE-2026-19024
hdf5 : CVE-2026-19026 : https://nvd.nist.gov/vuln/detail/CVE-2026-19026
hdf5 : CVE-2026-19027 : https://nvd.nist.gov/vuln/detail/CVE-2026-19027
hdf5 : CVE-2026-19028 : https://nvd.nist.gov/vuln/detail/CVE-2026-19028
hdf5 : CVE-2026-92627 : https://nvd.nist.gov/vuln/detail/CVE-2026-92627
hplip : CVE-2026-8631 : https://nvd.nist.gov/vuln/detail/CVE-2026-8631
hplip : CVE-2026-8632 : https://nvd.nist.gov/vuln/detail/CVE-2026-8632
imagemagick : CVE-2026-55628 : https://nvd.nist.gov/vuln/detail/CVE-2026-55628
imagemagick : CVE-2026-56376 : https://nvd.nist.gov/vuln/detail/CVE-2026-56376
imagemagick : CVE-2026-86420 : https://nvd.nist.gov/vuln/detail/CVE-2026-86420
imagemagick : CVE-2026-86421 : https://nvd.nist.gov/vuln/detail/CVE-2026-86421
imagemagick : CVE-2026-86422 : https://nvd.nist.gov/vuln/detail/CVE-2026-86422
imagemagick : CVE-2026-86423 : https://nvd.nist.gov/vuln/detail/CVE-2026-86423
imagemagick : CVE-2026-86424 : https://nvd.nist.gov/vuln/detail/CVE-2026-86424
imagemagick : CVE-2026-86425 : https://nvd.nist.gov/vuln/detail/CVE-2026-86425
imagemagick : CVE-2026-93586 : https://nvd.nist.gov/vuln/detail/CVE-2026-93586
imagemagick : CVE-2026-93587 : https://nvd.nist.gov/vuln/detail/CVE-2026-93587
imagemagick : CVE-2026-93588 : https://nvd.nist.gov/vuln/detail/CVE-2026-93588
imagemagick : CVE-2026-93589 : https://nvd.nist.gov/vuln/detail/CVE-2026-93589
imagemagick : CVE-2026-93590 : https://nvd.nist.gov/vuln/detail/CVE-2026-93590
krb5 : CVE-1999-1321 : https://nvd.nist.gov/vuln/detail/CVE-1999-1321
libcereal : CVE-2026-11463 : https://nvd.nist.gov/vuln/detail/CVE-2026-11463
libde265 : CVE-2026-54240 : https://nvd.nist.gov/vuln/detail/CVE-2026-54240
libde265 : CVE-2026-54241 : https://nvd.nist.gov/vuln/detail/CVE-2026-54241
libheif : CVE-2026-32814 : https://nvd.nist.gov/vuln/detail/CVE-2026-32814
libheif : CVE-2026-32882 : https://nvd.nist.gov/vuln/detail/CVE-2026-32882
libheif : CVE-2026-3950 : https://nvd.nist.gov/vuln/detail/CVE-2026-3950
libheif : CVE-2026-41069 : https://nvd.nist.gov/vuln/detail/CVE-2026-41069
libheif : CVE-2026-47178 : https://nvd.nist.gov/vuln/detail/CVE-2026-47178
libheif : CVE-2026-47247 : https://nvd.nist.gov/vuln/detail/CVE-2026-47247
libheif : CVE-2026-47251 : https://nvd.nist.gov/vuln/detail/CVE-2026-47251
libheif : CVE-2026-47254 : https://nvd.nist.gov/vuln/detail/CVE-2026-47254
libheif : CVE-2026-47709 : https://nvd.nist.gov/vuln/detail/CVE-2026-47709
libheif : CVE-2026-47714 : https://nvd.nist.gov/vuln/detail/CVE-2026-47714
libheif : CVE-2026-48029 : https://nvd.nist.gov/vuln/detail/CVE-2026-48029
libheif : CVE-2026-49271 : https://nvd.nist.gov/vuln/detail/CVE-2026-49271
libheif : CVE-2026-50142 : https://nvd.nist.gov/vuln/detail/CVE-2026-50142
libheif : CVE-2026-62291 : https://nvd.nist.gov/vuln/detail/CVE-2026-62291
libheif : CVE-2026-62292 : https://nvd.nist.gov/vuln/detail/CVE-2026-62292
libheif : CVE-2026-84383 : https://nvd.nist.gov/vuln/detail/CVE-2026-84383
libheif : CVE-2026-84384 : https://nvd.nist.gov/vuln/detail/CVE-2026-84384
libheif : CVE-2026-84444 : https://nvd.nist.gov/vuln/detail/CVE-2026-84444
libheif : CVE-2026-84446 : https://nvd.nist.gov/vuln/detail/CVE-2026-84446
libheif : CVE-2026-84447 : https://nvd.nist.gov/vuln/detail/CVE-2026-84447
libheif : CVE-2026-84448 : https://nvd.nist.gov/vuln/detail/CVE-2026-84448
libheif : CVE-2026-84449 : https://nvd.nist.gov/vuln/detail/CVE-2026-84449
libheif : CVE-2026-84450 : https://nvd.nist.gov/vuln/detail/CVE-2026-84450
libheif : CVE-2026-84451 : https://nvd.nist.gov/vuln/detail/CVE-2026-84451
libiec61850 : CVE-2026-19259 : https://nvd.nist.gov/vuln/detail/CVE-2026-19259
libiec61850 : CVE-2026-49035 : https://nvd.nist.gov/vuln/detail/CVE-2026-49035
libiec61850 : CVE-2026-50032 : https://nvd.nist.gov/vuln/detail/CVE-2026-50032
libiec61850 : CVE-2026-50039 : https://nvd.nist.gov/vuln/detail/CVE-2026-50039
libiec61850 : CVE-2026-50103 : https://nvd.nist.gov/vuln/detail/CVE-2026-50103
libiec61850 : CVE-2026-56758 : https://nvd.nist.gov/vuln/detail/CVE-2026-56758
libiec61850 : CVE-2026-63550 : https://nvd.nist.gov/vuln/detail/CVE-2026-63550
libiec61850 : CVE-2026-65421 : https://nvd.nist.gov/vuln/detail/CVE-2026-65421
libiec61850 : CVE-2026-66349 : https://nvd.nist.gov/vuln/detail/CVE-2026-66349
libiec61850 : CVE-2026-66360 : https://nvd.nist.gov/vuln/detail/CVE-2026-66360
libiec61850 : CVE-2026-66364 : https://nvd.nist.gov/vuln/detail/CVE-2026-66364
libiec61850 : CVE-2026-66369 : https://nvd.nist.gov/vuln/detail/CVE-2026-66369
libiec61850 : CVE-2026-66720 : https://nvd.nist.gov/vuln/detail/CVE-2026-66720
libjxl : CVE-2026-82522 : https://nvd.nist.gov/vuln/detail/CVE-2026-82522
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
libssh : CVE-2026-59842 : https://nvd.nist.gov/vuln/detail/CVE-2026-59842
libssh : CVE-2026-59851 : https://nvd.nist.gov/vuln/detail/CVE-2026-59851
libuvc : CVE-2026-1991 : https://nvd.nist.gov/vuln/detail/CVE-2026-1991
libvncserver : CVE-2026-32853 : https://nvd.nist.gov/vuln/detail/CVE-2026-32853
libvncserver : CVE-2026-32854 : https://nvd.nist.gov/vuln/detail/CVE-2026-32854
libvncserver : CVE-2026-44988 : https://nvd.nist.gov/vuln/detail/CVE-2026-44988
libvncserver : CVE-2026-50538 : https://nvd.nist.gov/vuln/detail/CVE-2026-50538
libwebsockets : CVE-2026-19773 : https://nvd.nist.gov/vuln/detail/CVE-2026-19773
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
ndpi : CVE-2026-86098 : https://nvd.nist.gov/vuln/detail/CVE-2026-86098
neatvnc : CVE-2026-42859 : https://nvd.nist.gov/vuln/detail/CVE-2026-42859
net-snmp : CVE-2026-89147 : https://nvd.nist.gov/vuln/detail/CVE-2026-89147
netdata : CVE-2024-32019 : https://nvd.nist.gov/vuln/detail/CVE-2024-32019
netdata : CVE-2025-71385 : https://nvd.nist.gov/vuln/detail/CVE-2025-71385
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
ntopng : CVE-2026-84989 : https://nvd.nist.gov/vuln/detail/CVE-2026-84989
ntopng : CVE-2026-86090 : https://nvd.nist.gov/vuln/detail/CVE-2026-86090
ntopng : CVE-2026-86091 : https://nvd.nist.gov/vuln/detail/CVE-2026-86091
ntpsec : CVE-2016-1547 : https://nvd.nist.gov/vuln/detail/CVE-2016-1547
ntpsec : CVE-2016-1548 : https://nvd.nist.gov/vuln/detail/CVE-2016-1548
ntpsec : CVE-2016-1549 : https://nvd.nist.gov/vuln/detail/CVE-2016-1549
ntpsec : CVE-2016-1550 : https://nvd.nist.gov/vuln/detail/CVE-2016-1550
ntpsec : CVE-2016-1551 : https://nvd.nist.gov/vuln/detail/CVE-2016-1551
ntpsec : CVE-2026-18321 : https://nvd.nist.gov/vuln/detail/CVE-2026-18321
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
openvpn : CVE-2026-78043 : https://nvd.nist.gov/vuln/detail/CVE-2026-78043
openvpn : CVE-2026-78221 : https://nvd.nist.gov/vuln/detail/CVE-2026-78221
openvpn : CVE-2026-81738 : https://nvd.nist.gov/vuln/detail/CVE-2026-81738
openvpn : CVE-2026-82312 : https://nvd.nist.gov/vuln/detail/CVE-2026-82312
openvpn : CVE-2026-84226 : https://nvd.nist.gov/vuln/detail/CVE-2026-84226
openvpn : CVE-2026-84256 : https://nvd.nist.gov/vuln/detail/CVE-2026-84256
openvpn : CVE-2026-84732 : https://nvd.nist.gov/vuln/detail/CVE-2026-84732
pcapplusplus : CVE-2026-13587 : https://nvd.nist.gov/vuln/detail/CVE-2026-13587
pcapplusplus : CVE-2026-13588 : https://nvd.nist.gov/vuln/detail/CVE-2026-13588
pcapplusplus : CVE-2026-13589 : https://nvd.nist.gov/vuln/detail/CVE-2026-13589
pcapplusplus : CVE-2026-13590 : https://nvd.nist.gov/vuln/detail/CVE-2026-13590
pipewire : CVE-2026-5674 : https://nvd.nist.gov/vuln/detail/CVE-2026-5674
polkit : CVE-2016-2568 : https://nvd.nist.gov/vuln/detail/CVE-2016-2568
poppler : CVE-2025-52885 : https://nvd.nist.gov/vuln/detail/CVE-2025-52885
postfix : CVE-2023-32182 : https://nvd.nist.gov/vuln/detail/CVE-2023-32182
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
python3-nltk : CVE-2026-71513 : https://nvd.nist.gov/vuln/detail/CVE-2026-71513
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
python3-sqlparse : CVE-2026-84305 :
https://nvd.nist.gov/vuln/detail/CVE-2026-84305
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
python3-tornado : CVE-2026-82397 :
https://nvd.nist.gov/vuln/detail/CVE-2026-82397
python3-tornado : CVE-2026-91990 :
https://nvd.nist.gov/vuln/detail/CVE-2026-91990
python3-tornado : CVE-2026-91991 :
https://nvd.nist.gov/vuln/detail/CVE-2026-91991
python3-tqdm : CVE-2024-34062 : https://nvd.nist.gov/vuln/detail/CVE-2024-34062
python3-twisted : CVE-2024-41671 :
https://nvd.nist.gov/vuln/detail/CVE-2024-41671
rabbitmq-c : CVE-2026-44235 : https://nvd.nist.gov/vuln/detail/CVE-2026-44235
rabbitmq-c : CVE-2026-44236 : https://nvd.nist.gov/vuln/detail/CVE-2026-44236
rapidjson : CVE-2024-38517 : https://nvd.nist.gov/vuln/detail/CVE-2024-38517
rapidjson : CVE-2024-39684 : https://nvd.nist.gov/vuln/detail/CVE-2024-39684
redis : CVE-2026-23479 : https://nvd.nist.gov/vuln/detail/CVE-2026-23479
redis : CVE-2026-23631 : https://nvd.nist.gov/vuln/detail/CVE-2026-23631
redis : CVE-2026-25243 : https://nvd.nist.gov/vuln/detail/CVE-2026-25243
redis : CVE-2026-66373 : https://nvd.nist.gov/vuln/detail/CVE-2026-66373
redis : CVE-2026-81934 : https://nvd.nist.gov/vuln/detail/CVE-2026-81934
rsyslog : CVE-2026-55556 : https://nvd.nist.gov/vuln/detail/CVE-2026-55556
rsyslog : CVE-2026-61548 : https://nvd.nist.gov/vuln/detail/CVE-2026-61548
sd : CVE-2015-2909 : https://nvd.nist.gov/vuln/detail/CVE-2015-2909
sd : CVE-2025-31700 : https://nvd.nist.gov/vuln/detail/CVE-2025-31700
sd : CVE-2025-31701 : https://nvd.nist.gov/vuln/detail/CVE-2025-31701
sd : CVE-2025-31702 : https://nvd.nist.gov/vuln/detail/CVE-2025-31702
smarty : CVE-2008-4811 : https://nvd.nist.gov/vuln/detail/CVE-2008-4811
smarty : CVE-2024-35226 : https://nvd.nist.gov/vuln/detail/CVE-2024-35226
smarty : CVE-2026-62992 : https://nvd.nist.gov/vuln/detail/CVE-2026-62992
smarty : CVE-2026-62993 : https://nvd.nist.gov/vuln/detail/CVE-2026-62993
smarty : CVE-2026-62996 : https://nvd.nist.gov/vuln/detail/CVE-2026-62996
sngrep : CVE-2026-90558 : https://nvd.nist.gov/vuln/detail/CVE-2026-90558
squid : CVE-2026-47729 : https://nvd.nist.gov/vuln/detail/CVE-2026-47729
squid : CVE-2026-50012 : https://nvd.nist.gov/vuln/detail/CVE-2026-50012
sthttpd : CVE-2021-26843 : https://nvd.nist.gov/vuln/detail/CVE-2021-26843
strongswan : CVE-2026-78123 : https://nvd.nist.gov/vuln/detail/CVE-2026-78123
strongswan : CVE-2026-78124 : https://nvd.nist.gov/vuln/detail/CVE-2026-78124
strongswan : CVE-2026-78126 : https://nvd.nist.gov/vuln/detail/CVE-2026-78126
strongswan : CVE-2026-78127 : https://nvd.nist.gov/vuln/detail/CVE-2026-78127
strongswan : CVE-2026-78129 : https://nvd.nist.gov/vuln/detail/CVE-2026-78129
strongswan : CVE-2026-78130 : https://nvd.nist.gov/vuln/detail/CVE-2026-78130
strongswan : CVE-2026-78131 : https://nvd.nist.gov/vuln/detail/CVE-2026-78131
strongswan : CVE-2026-78132 : https://nvd.nist.gov/vuln/detail/CVE-2026-78132
strongswan : CVE-2026-78133 : https://nvd.nist.gov/vuln/detail/CVE-2026-78133
strongswan : CVE-2026-78134 : https://nvd.nist.gov/vuln/detail/CVE-2026-78134
strongswan : CVE-2026-78135 : https://nvd.nist.gov/vuln/detail/CVE-2026-78135
stunnel : CVE-2026-70367 : https://nvd.nist.gov/vuln/detail/CVE-2026-70367
stunnel : CVE-2026-70368 : https://nvd.nist.gov/vuln/detail/CVE-2026-70368
syslog-ng : CVE-2026-39879 : https://nvd.nist.gov/vuln/detail/CVE-2026-39879
tesseract : CVE-2026-88047 : https://nvd.nist.gov/vuln/detail/CVE-2026-88047
tesseract : CVE-2026-88048 : https://nvd.nist.gov/vuln/detail/CVE-2026-88048
tesseract : CVE-2026-88049 : https://nvd.nist.gov/vuln/detail/CVE-2026-88049
tesseract : CVE-2026-88050 : https://nvd.nist.gov/vuln/detail/CVE-2026-88050
tesseract : CVE-2026-88051 : https://nvd.nist.gov/vuln/detail/CVE-2026-88051
tesseract : CVE-2026-88052 : https://nvd.nist.gov/vuln/detail/CVE-2026-88052
tesseract : CVE-2026-88053 : https://nvd.nist.gov/vuln/detail/CVE-2026-88053
tesseract : CVE-2026-88054 : https://nvd.nist.gov/vuln/detail/CVE-2026-88054
thrift : CVE-2025-48431 : https://nvd.nist.gov/vuln/detail/CVE-2025-48431
thrift : CVE-2026-41602 : https://nvd.nist.gov/vuln/detail/CVE-2026-41602
thrift : CVE-2026-41604 : https://nvd.nist.gov/vuln/detail/CVE-2026-41604
thrift : CVE-2026-41605 : https://nvd.nist.gov/vuln/detail/CVE-2026-41605
thrift : CVE-2026-41606 : https://nvd.nist.gov/vuln/detail/CVE-2026-41606
thrift : CVE-2026-41607 : https://nvd.nist.gov/vuln/detail/CVE-2026-41607
thrift : CVE-2026-41636 : https://nvd.nist.gov/vuln/detail/CVE-2026-41636
thrift : CVE-2026-43871 : https://nvd.nist.gov/vuln/detail/CVE-2026-43871
thrift : CVE-2026-49158 : https://nvd.nist.gov/vuln/detail/CVE-2026-49158
thrift : CVE-2026-55968 : https://nvd.nist.gov/vuln/detail/CVE-2026-55968
thrift : CVE-2026-66053 : https://nvd.nist.gov/vuln/detail/CVE-2026-66053
tinyproxy : CVE-2026-54388 : https://nvd.nist.gov/vuln/detail/CVE-2026-54388
tmate : CVE-2026-4751 : https://nvd.nist.gov/vuln/detail/CVE-2026-4751
tmux : CVE-2026-11623 : https://nvd.nist.gov/vuln/detail/CVE-2026-11623
udisks2 : CVE-2026-7867 : https://nvd.nist.gov/vuln/detail/CVE-2026-7867
unbound : CVE-2026-14586 : https://nvd.nist.gov/vuln/detail/CVE-2026-14586
unbound : CVE-2026-40691 : https://nvd.nist.gov/vuln/detail/CVE-2026-40691
unbound : CVE-2026-41637 : https://nvd.nist.gov/vuln/detail/CVE-2026-41637
unbound : CVE-2026-44690 : https://nvd.nist.gov/vuln/detail/CVE-2026-44690
unbound : CVE-2026-77860 : https://nvd.nist.gov/vuln/detail/CVE-2026-77860
unbound : CVE-2026-77955 : https://nvd.nist.gov/vuln/detail/CVE-2026-77955
unbound : CVE-2026-78227 : https://nvd.nist.gov/vuln/detail/CVE-2026-78227
unbound : CVE-2026-80225 : https://nvd.nist.gov/vuln/detail/CVE-2026-80225
unbound : CVE-2026-81634 : https://nvd.nist.gov/vuln/detail/CVE-2026-81634
unbound : CVE-2026-81642 : https://nvd.nist.gov/vuln/detail/CVE-2026-81642
unbound : CVE-2026-82717 : https://nvd.nist.gov/vuln/detail/CVE-2026-82717
unbound : CVE-2026-82720 : https://nvd.nist.gov/vuln/detail/CVE-2026-82720
unbound : CVE-2026-85501 : https://nvd.nist.gov/vuln/detail/CVE-2026-85501
usbmuxd : CVE-2025-66004 : https://nvd.nist.gov/vuln/detail/CVE-2025-66004
valkey : CVE-2026-86227 : https://nvd.nist.gov/vuln/detail/CVE-2026-86227
vlc : CVE-2017-8311 : https://nvd.nist.gov/vuln/detail/CVE-2017-8311
vlc : CVE-2017-8312 : https://nvd.nist.gov/vuln/detail/CVE-2017-8312
vlc : CVE-2017-8313 : https://nvd.nist.gov/vuln/detail/CVE-2017-8313
webkitgtk3 : CVE-2026-78376 : https://nvd.nist.gov/vuln/detail/CVE-2026-78376
webkitgtk3 : CVE-2026-83596 : https://nvd.nist.gov/vuln/detail/CVE-2026-83596
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
wolfssl : CVE-2026-10097 : https://nvd.nist.gov/vuln/detail/CVE-2026-10097
wolfssl : CVE-2026-10592 : https://nvd.nist.gov/vuln/detail/CVE-2026-10592
wolfssl : CVE-2026-11310 : https://nvd.nist.gov/vuln/detail/CVE-2026-11310
wolfssl : CVE-2026-11703 : https://nvd.nist.gov/vuln/detail/CVE-2026-11703
wolfssl : CVE-2026-11999 : https://nvd.nist.gov/vuln/detail/CVE-2026-11999
wolfssl : CVE-2026-55960 : https://nvd.nist.gov/vuln/detail/CVE-2026-55960
wolfssl : CVE-2026-55961 : https://nvd.nist.gov/vuln/detail/CVE-2026-55961
wolfssl : CVE-2026-55962 : https://nvd.nist.gov/vuln/detail/CVE-2026-55962
wolfssl : CVE-2026-55964 : https://nvd.nist.gov/vuln/detail/CVE-2026-55964
wolfssl : CVE-2026-55967 : https://nvd.nist.gov/vuln/detail/CVE-2026-55967
wolfssl : CVE-2026-6329 : https://nvd.nist.gov/vuln/detail/CVE-2026-6329
wolfssl : CVE-2026-6330 : https://nvd.nist.gov/vuln/detail/CVE-2026-6330
wolfssl : CVE-2026-6331 : https://nvd.nist.gov/vuln/detail/CVE-2026-6331
wolfssl : CVE-2026-6678 : https://nvd.nist.gov/vuln/detail/CVE-2026-6678
wolfssl : CVE-2026-7511 : https://nvd.nist.gov/vuln/detail/CVE-2026-7511
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
zabbix : CVE-2026-23929 : https://nvd.nist.gov/vuln/detail/CVE-2026-23929
zabbix : CVE-2026-23930 : https://nvd.nist.gov/vuln/detail/CVE-2026-23930
zabbix : CVE-2026-23935 : https://nvd.nist.gov/vuln/detail/CVE-2026-23935
zabbix : CVE-2026-23937 : https://nvd.nist.gov/vuln/detail/CVE-2026-23937
zabbix : CVE-2026-23938 : https://nvd.nist.gov/vuln/detail/CVE-2026-23938
zabbix : CVE-2026-59781 : https://nvd.nist.gov/vuln/detail/CVE-2026-59781
zeroconf : CVE-2026-47180 : https://nvd.nist.gov/vuln/detail/CVE-2026-47180
zeroconf : CVE-2026-47183 : https://nvd.nist.gov/vuln/detail/CVE-2026-47183
zeroconf : CVE-2026-47184 : https://nvd.nist.gov/vuln/detail/CVE-2026-47184
zeroconf : CVE-2026-48045 : https://nvd.nist.gov/vuln/detail/CVE-2026-48045
zeroconf : CVE-2026-48487 : https://nvd.nist.gov/vuln/detail/CVE-2026-48487

