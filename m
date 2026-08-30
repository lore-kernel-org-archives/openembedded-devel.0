Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F46C61DE1
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 18:20:07 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13436.1788113999026107032
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Aug 2026 11:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=id/RkZ2E;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: jan.vermaete@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-81f36179d72so31471367b3.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Aug 2026 11:19:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788113998; cv=none;
        d=google.com; s=arc-20260327;
        b=HDqXuaFIHu+ffrWxjG66wnN58YmE5rAdwu8toqgck3QGgsTGF2xcLnsQHAJyqYnRCu
         +lmBRvB5ztdpnzTjsOb8lFsGdLPkCq4NJFdLhniyCf1ehyU3C0OD5Jyy0IeTYp++ZZxe
         54ETbym8jKqGJrdH/wRcJkeG1jRWPide6dOj/SEz7d5x6ZknEov4c++d99DvAW8TrXj1
         RCY2/7ZvjvfBePxR8N79iSM6qNvQx7FtkKEAwBuCTc8WIe8/9DCT/j0KnBX4PLSN13Fr
         e/zoeIApo51jWScHnfpfQJ1RFXPTw/QoxOf8k7Dz8ubrA9KTWO92wDKkxyoD+nBVFxn/
         xg3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=j7e6U3GK0DJEQUkA7vkuVxlqRO6mPhbx0jyBFX0Dr7k=;
        fh=ft9o+otwsIY1Xrcr1W3RWScU1Y/oskc36I9yKMW7j60=;
        b=BZ+PY9cBY5dUpEgreHfDaEHM/j720sYyFOe3P9ZBOQsz9k2dEVZQ+WGxygR2unacFZ
         R4PMONcXpzc5FOZJyUCLUEbonOMrTyncSVpH15tDmwntoTj6lifSuVs8Z5FIlc4wgznv
         w2y2sWyt4F2xiZJWuPZ2uZE14Z2PcEMrqvL+lfjdft8L6r6gxmFr3vZHaQogr2x96lmV
         MR/U9ytlgSaYesa3KS5IDJpA1fmIYRh2ysnMoyDhu7fNbUNplz7oLJgb7M5d5/sxCV6a
         wMgv3ogqnjY85JYXOxooOUe6q/NTl/T5Kv6Dou8CH8uMhlCjPxiZzLGTOkLIPgVGNDTx
         TFug==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788113998; x=1788718798; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j7e6U3GK0DJEQUkA7vkuVxlqRO6mPhbx0jyBFX0Dr7k=;
        b=id/RkZ2EVhfV6jV0qGXuRfp5v/WSpwnNkuMi1+kb4FGx+bk3z2SjvgLIUhIUjEQCRB
         +U3Cs11cxFZtZzkFeY1AO8LVxj+oFciNZrpX/JToJQZw2q3X7rYnuxPXyxnsTHTCvAnn
         lnVwwhkXn4cgQ5DJWWrcqJmhiRDDsIPZgTe6AwdZuls2KKukzN8vzGUDtZESd4QlfdT8
         pY0BK3RkTyvJt5CgdF3eJrwpYn26iWzAmH5XwrNCwYHutMC9HJjWvQtNuYHD49//d4TK
         R4W2uFYJdI6pgJA26rmH0A9JQFRHArONQ2UiLimPoKxCz8AeB1Aou4Qz3MhGGYfVF63S
         hyTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788113998; x=1788718798;
        h=content-transfer-encoding:content-type:cc:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j7e6U3GK0DJEQUkA7vkuVxlqRO6mPhbx0jyBFX0Dr7k=;
        b=r2hd97dzuF1DnNh3BDyCtbTK9Vr4pzUviVqe3HcG86JMEWWEKZOtTR8ue3Cd4wmDeH
         FfxYvI3c3kKfZrp6W4wBz6Q9gARaXTSgtFR8pORcuR2K1dxSU928MjN9FgrGxB2VhXZq
         CVG3PnspzhD/WHtWxJJ9dhiON/mWZEvaePgICo5X4wLPjjjRZsv+Ya3BxMkKSGtwSkLN
         Sqhr97uuPSpdQaqOEsTst8v5AhD0WzLz0Ue7+KppmpC/v9WZo+NmOdNSiCHwtrAWoWCJ
         xiWnJCl/NPrXCKe/vDje3YBrlYEFjKLErwb+lYwOtTDZGI+dgzk8RsyLsi8wFIYa00W5
         iF8g==
X-Gm-Message-State: AFuF++m/IDXed+N0G7y726l8I2COa+AwN7dJMB/GQAqmtVEqu6JlvEaG
	GE5Z38FkAD2LyKsMkDUwkpEg9s+kmyngbBGN9bKqbJ5iwR5wSAj8e2UfEJarzNvp5obtdWMPaDQ
	5376wXwh1wuQK6YV1fNxYG8xlNfAZWp/9x+W4tsc=
X-Gm-Gg: AYBFou3ZEVLMremErIvUKdfQb7YDvRZoL+R/+o2cE5yOzL1UeIIZhxVjqKKOJwKnuS/
	aaob56dT400RMhG+okZ6xOZTBtSbj2tB3ezBpr0vH8ZQ5WzsQXyG/9JgtjOzlaFKntrVcj9VlQ5
	UMx/5wY7RP21qpPTZUWVmmvmfutveWGHoVyxpXh80jJW5bXr1BWaGfxak3Vq2g9xG3QcDybgniX
	bcgRFL0TCiLgBuG6lH5gYu4fAKwjhLViEGJenFo+zyYAWYadady72GO1f9ZbQTffRUf9Jsv4m1R
	scNV5TF9A7QfhUq0EXUy9T+gCED7+C2uZAVDO20rElaGnYFqQx+f3jOWhq0SGdjcxEWz7AZj4r+
	L/yxRCYvPcMRCFJF+jFQJL/tNvW9DE/MRqVGvecEyKAlk
X-Received: by 2002:a05:690c:660b:b0:857:97ce:dfa5 with SMTP id
 00721157ae682-85d684bd753mr75524377b3.10.1788113997942; Sun, 30 Aug 2026
 11:19:57 -0700 (PDT)
MIME-Version: 1.0
From: jan vermaete <jan.vermaete@gmail.com>
Date: Sun, 30 Aug 2026 20:19:47 +0200
X-Gm-Features: AcwNN1UuNvTB5rVI1baCsvdVbrIaJH460NwH-vJ3xP5IIP5K13vj4aSCmabZr0o
Message-ID: <CABF_=yheHCLAo=jCHROfC6k99652Kg73tZBJie1woRcgA8ccFw@mail.gmail.com>
Subject: When can a recipe scattered around be ready to promote to meta-openembedded?
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Aug 2026 18:20:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129597

For example the recipe python3-construct
(https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Dpyth=
on3-construct)
exist in 5 different layers


openembedded-devel@lists.openembedded.org

--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

