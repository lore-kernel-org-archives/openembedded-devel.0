Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53060C61DE1
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 18:22:47 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13520.1788114164762396163
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Aug 2026 11:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UGEJex2E;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: jan.vermaete@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-861f30636f9so11456257b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Aug 2026 11:22:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788114164; cv=none;
        d=google.com; s=arc-20260327;
        b=BTwdeGzXqnrR5zACuGwNe79uTMdXu/2UL39I4nI1seTKnXR6PDPBGT2PAwWbhNzyIW
         s51qRUnSZxo+93YPQaLpH15GZYlysBZurE1/epO1tMxfbcqIBgIoL4//Af97Z1fqsTnP
         DbWKG/aq/EKhDksIS8oLzMIxIE9bZYtzOIjgVjZlpEMMPpCK5aL4EGJEoGEe1/LTS/zs
         6W7DPM/HHCPQyGEdjd9h7Onzk5K8d1CWZw5HgJmhfC5Em8T3xAFIe5ML5XxJwB6JuysW
         t3Te6VbtiZ+3apB9c1icbQ5VxvcEJAn377bbMPuhN53f4IHEDmuSPjU4xktyvQRpXOZZ
         5HTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SmzVku3VctGQ/smRja/PeLdtnXUxx5WxF8G0LAgajxg=;
        fh=ft9o+otwsIY1Xrcr1W3RWScU1Y/oskc36I9yKMW7j60=;
        b=MwVAcAv/aruz3govLrZbMZLwmDW3WKy0mMmNOmSvVwTIopPuHLYYifSncL5Qj7jUpw
         oYUNgh34QhQdRbxaFzRh0LOXJS4p47WlFeNvohl3xjvgMxRQfPedbFEXMrTtFVwqcrq7
         LbOuUwrbDFRN5NBaiFBQIbGx1o+Zo58JQ0xpnvoZy321sZWZPx5557fYnW7Aci7fxCW5
         P8pB+GtJmTCg4Pr/ivuAOw3xX3A38hhEEEd2n5ezU28PJbavCVOPcKT8cdezYwpVBo4U
         dG4j8lMxAEuw1rKJuCDqrXMER7MciBAWmmPHIGTQ3B7QD523Fx10HYlpDiC1XhUGFtWh
         wg0A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788114164; x=1788718964; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SmzVku3VctGQ/smRja/PeLdtnXUxx5WxF8G0LAgajxg=;
        b=UGEJex2ELTE21l0Tg8o1JHXiWxqCQpgAGSAavciXsXSnEPSlhzKPZ4U1N8pdkPejfK
         nCJ8nDWo6fYmc+PSVUBB7/vValW5zaexNn04gaMA+YPsIXhtIt7JwskM1n7ytHk5hDzP
         /b0njIxYWiCByqCXkams8RK4Lu4vwGcBEXVlwhUMMj4xTZdrx2fZdA9bOo2oB4vq48oB
         9A4tuL9HYOzS5/c+j3CUnzvMhX7HBE8uwVsiUSHJsmL1n6EOt0481PASj0hTOrIEl6G5
         kwGbH5TOuSi4K0byVIzYAZ+i7FXUD7OEMdPlcN9pv/WzUVqo4e8gHVWj05MA0/fqJ3yf
         Eg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788114164; x=1788718964;
        h=content-transfer-encoding:content-type:cc:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SmzVku3VctGQ/smRja/PeLdtnXUxx5WxF8G0LAgajxg=;
        b=Fwjo3JCbPjH1L+cR0guqsdHaSvkoxG8/3nO2cvZCw12aDWuK5605N1tZhHFQYgCPFG
         WY+ziHffgVyqcvPjKCkbQfDuEeFR9jx2EzJq4rvE/a3Mn1drIXceBBP8V1EQnRsfEwBB
         gFOKpJPNAr4Wxo8P9hF7PVUij4QGEzHGwdnHi0YG0Q8gaGbmeYNje3CMHQ5fqJOFcLhH
         DscXmo29Dj1lNJYACvuGb0yllReOPe5ZQMOy08qSDghxBKeIadbsAYc6de9bHPOFmq4v
         pT4N8QVSCtSK1QFjB6PvfzWNVhzRLIHThnHwGy6MISDJzKBAAUni84R9Yk22+qNRC4rm
         XEIA==
X-Gm-Message-State: AFuF++nxU2uXQTu8ALUp6xZR6Qb8cNn+zzVegxMulVomfhHOMi6pKhkw
	dR0mYerzwnRZfgXyYulhRhAn3gP314M39dO+W+adqyRNvSusuB4QNd1am5V6ZEGnvtb6Wzd3pt9
	/cG/Ph5Qng8ipJqyo8khlnJ77e+Qs72XPh4Te9W8=
X-Gm-Gg: AYBFou2UdhV1ZOtdtYnhrZkkXACEIgqPaa6Uo54Xq1UsIn94PD1bjfPjI2RD0Z8v+5M
	DpTzv4WQjuw51I2su0LIaKJP0NW6ad8FyLW51+aHtudxJHCI4ZIjRggytNt+JLO92yYwY3nhGHB
	YyMSj/aDqcXvqmbvP8Sp5iNMR/kRwsYlDWQ5dIb/eik0NY5bz7KvbzMv/9nFr9Lbm912nOsZFk6
	PWhvE1Bp8sea8BJ/J6eVNI6Xns4uF5QoIr9hpOSkR8Z9yCWI+nWBLH+slY+eksAuAE0VoeA8rLD
	Q56jTzkiEy6P9QiOlOd6fcyYrSlCk0UfnJlawZCfB6GBgAbbt4lEcV3Xxd3+XEvoc/awznlWK+Q
	HLTweHbw50TqkUFRQhJaWd0uI57Fh7PVXpg==
X-Received: by 2002:a05:690c:60c1:b0:81e:7dfa:b799 with SMTP id
 00721157ae682-85d6b179defmr71436697b3.24.1788114163741; Sun, 30 Aug 2026
 11:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <CABF_=yheHCLAo=jCHROfC6k99652Kg73tZBJie1woRcgA8ccFw@mail.gmail.com>
In-Reply-To: <CABF_=yheHCLAo=jCHROfC6k99652Kg73tZBJie1woRcgA8ccFw@mail.gmail.com>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Sun, 30 Aug 2026 20:22:32 +0200
X-Gm-Features: AcwNN1Uyo4JWag2vnT8J7w5Oa-K8Ye-S4ab0D5cE7vbny6pQT-BK-PpDd0l6t6E
Message-ID: <CABF_=yird-Xz_nEWtVbgeve0WC2FH_Bq8Nu39kx2-DveyaHZZA@mail.gmail.com>
Subject: Re: When can a recipe scattered around be ready to promote to meta-openembedded?
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Aug 2026 18:22:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129598

Let me redo, without sending it too fast :-(

For example the recipe python3-construct
(https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Dpyth=
on3-construct)
exist in 5 different layers.

Although it didn't had a release in the near past
(https://pypi.org/project/construct/), those 5 layers kind of prove
it's a useful thing to have.

So, when and how to promote this to meta-python?

On Sun, Aug 30, 2026 at 8:19=E2=80=AFPM jan vermaete <jan.vermaete@gmail.co=
m> wrote:
>
> For example the recipe python3-construct
> (https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Dpy=
thon3-construct)
> exist in 5 different layers
>
>
> openembedded-devel@lists.openembedded.org
>
> --
> Jan Vermaete
> =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel



--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

