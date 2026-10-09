Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0803CA6015
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 05:35:51 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1724.1791524146824062252
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 08 Oct 2026 22:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LOaOml9y;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8ac525c1f05so58000567b3.1
        for <Openembedded-devel@lists.openembedded.org>; Thu, 08 Oct 2026 22:35:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791524146; cv=none;
        d=google.com; s=arc-20260327;
        b=MZ+4Gmx7TSxb5aw0mYm3NzKMUSVZr/FQgejx0AWTGmyM9nnvSgHdLNL/6q4YLMvMGs
         nyd33/OQPJ3uKmFnNcWC/8rJ5uWdfoTz/0rqUA2+ZiZEHzPrKTdpw2XTGVVMvdDsXglK
         SJiEB24yV3kP/2wqFjZeSqA9YxsDJZ4QEptJaoB1o+OqESH65iBfMGnIZ9gFRPwKuxya
         PVGiZ6WmJbFJwT4s470OQLnP8oQ5cwwZcpWavcyojSvwg+XN05de84NQL7YpIP0AQVXv
         Lhlg1lSGEBxHNCCrSHxFLp9/7NTeB59Z9KUOjtfw+RMj9LqilzJ5RAp7r8k5U7Fi+/vk
         yaxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=oG0B432xlQf1tUig+J8fja3/s+HQOhtR47iehK9PZiQ=;
        fh=MnWQIt+qfwr8t22dRaNnBDw2a+cdT5G5r5+L6LPLbJw=;
        b=HUKZEt6jbG0/3DstXnK0Yay4ueWEHjlOnTrGBmDokxbIkJkEbyIcYBN4beOV3OAK2g
         M9q7ucN+QsJtpaUDnPObPyKOxjiP4LvvNek/INgGOXublnS66IR10Tk/h/V8PfhlrjSs
         Vw8ucurQSucmANqT2p0lm6PuRsGc9JkBVcq4B7gS9FCfrlWtfbMYM389HnlxmSN2Puue
         iVrqtlWZ6dHhm2X1h0osnsDswagRsFSytXGPWTB+/wFN82YWI3Wrqmgi+DKrNWW6ZFMl
         qC5bl0w3kwy4g+YJRlEJqEiC39Ee7nFTR/LlvESPR0AyQv1WNyAQ6DEH8/99sUWvUtGn
         M9MA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791524146; x=1792128946; darn=lists.openembedded.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oG0B432xlQf1tUig+J8fja3/s+HQOhtR47iehK9PZiQ=;
        b=LOaOml9y7dATR1DKHD3csoSZC35Tubnpfiu+fdh/T0sdiwRLiZzxHHAaKxMNjBkHUF
         ammc3Lhdt3gwXybufNtUvDbGeeMdfvM7Cyfmi2PRdfbSYp1yGTqhnLfRPnSper+ysY9p
         0wR6NK/UOf2sueymZb9gfvXm2yRkBh/xVhnbWVinKioebf/5oprToRs8MXc/sInYAKlh
         wgmvMBtf6DlcSkdn3gvEZwg5mqZfydvCOGmZThjGoHw7o7a/vu1X1srV8d3Q/FsVfAEb
         73RrDOLuO1SqbPK86hJ9uz7MSpnftwUSqbxuY+45nvZC9OE+QJxmdZNgO7b9mFXT7cny
         13mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791524146; x=1792128946;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oG0B432xlQf1tUig+J8fja3/s+HQOhtR47iehK9PZiQ=;
        b=PwSzRyz5yGRmxCPMl4PtQIHQCUc1OabKHoIXByTJQV08foOJnsfsCzLLFYQTUfBpCU
         fgblSiftE/K6RSUC7Quguxo1pQDc3bgBAgYBfts3vKrJrPiDHevfebQCV1s/LamWdY7y
         1n1A/8RZ6WM+XkNNfWS6ViA6eCkVgC2lEKZVImcMMZYE9OtDYGJLjXayxSt8a1REsmBh
         DYcDtj9YmZTjNuV7/6XODGp2IDl+Tee3vov5M5MrysuOUAnbGLkBCV/918Q32hNemij1
         vMdNJY6olUysJJmymOFFuDvjLLIaYvqLveWE/5YqmOgSnt/EbFRA6CLLvXIAmqPlS3NE
         tSBw==
X-Gm-Message-State: AFq9FYKxjYLyxKkiOg6WDR9JEOUszuRzngue1VMDeTiT9RYhS9MYrGJq
	pcVcvhSkEnE2EE8dTXq3NJvc/awun+P57t2qRXu8IDEw83ovvNaSjbdioCIUqyUm1rswPg1QgCu
	igLQsvB4BgDzysVf7MDqcNIQ+lEhbsMx6F4IDUqCkkw==
X-Gm-Gg: AYBFou1tZVL9/6JUBZUcSiRDK/MdzaYN/h6OUQ98zJRLZqwRNhvZGBj+dnGuh6+XzZy
	PJo5PKPn3bDDdUgHJxJkuTT2xqUez8WJf0OJ58OkJv+w4gv2mMVUnWzCr2fj7yZm0drb8HYy2TO
	jbKrBYu6erpYXT9F5gtLgE/BOpy7U5QdSAMHG9/G10lHqL2Kma1Tmjk+72fTTMsSJV7AD/7Wzet
	+3nSp8OuBT90uD3AgTRTTC4AjBleZFXnaIfbfmevCSQzOLykGjvoTQBnOJtSlIrKi4oT5v7nHFJ
	lLigEvPTkjjexWLoBSFoEDN5ZLUgy2iYtKn+CHhvWM87cWa1Siq7xur4DGnvQ1cv88snK177bm4
	O3pv73RR1WoHWxMjSbrKvlxj4SIBqzAibFKczZEAEsW2vA2qiKeL99VrwtYmq/466ibKpvorvQf
	2oaKB0iVxjX9aTpfcq8tHySlRvF3PgbdwsRgvyM7zZ/UbljReW3cFMpZ0adk2MRBDG6D1UmAmjG
	CNXoYbts81Z5CVgmsED71Rxwsxtr01/1GfOQ+3XmLzvY8ebI/FrsTK0/1sJuBC78lDkIBocq6kB
	vOaoFU52
X-Received: by 2002:a05:690c:10:b0:8ab:6374:5637 with SMTP id
 00721157ae682-8b07ee265f1mr3466447b3.28.1791524145726; Thu, 08 Oct 2026
 22:35:45 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Oct 2026 22:35:18 -0700
X-Gm-Features: AclHuK8cAH3ZIdkSCxhKlechudXh5WErB6RXRR8IrrwGsobxJkv2ZZfZM5YXT4Q
Message-ID: <CAMKF1srDJiRWygw9=R8NrcFoU9shecb7XAmu3KY1Q9LgagGRvA@mail.gmail.com>
Subject: Blacksail release branch maintenance
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000500ca4065d61b8f6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 05:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130680

--000000000000500ca4065d61b8f6
Content-Type: text/plain; charset="UTF-8"

Hi All,

blacksail has been branched out for meta-openembedded. It will be
maintained by
Ankur Tyagi with full guidance from Anuj who is currently maintaining the
LTS branches
Please send backport requests as needed prefixed with [blacksail] in the
subject line.

Thank you
-Khem

--000000000000500ca4065d61b8f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,=C2=A0<div><br></div><div>blacksail has been branch=
ed out for meta-openembedded. It will be maintained by</div><div>Ankur Tyag=
i with full guidance from Anuj who is currently=C2=A0maintaining the LTS br=
anches</div><div>Please send backport requests as needed prefixed with [bla=
cksail] in the subject line.</div><div><br></div><div>Thank you</div><div>-=
Khem</div><div><br></div></div>

--000000000000500ca4065d61b8f6--

