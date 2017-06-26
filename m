Return-Path: <brownson4u@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id A08196FF7F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 00:49:49 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id 77so132087920wrb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jun 2017 17:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=7A2+bnfbuKOJ/62LtmoPjOJKooXbWTjkt42933Lt8/E=;
	b=o5wMbtUkECr4H1lTImirmhKnv7tSAjgszQoYQtgPGzvDmrps322sNZbJUI8aE7pOUD
	RX825qhbL87u1sN0yuC8/4ZFJUHwT8AYpxZw+AugEQjuLCCh9CpgBLeYBKKotvOjgw9K
	2e/z8CgXtbBpIcn/a8vKCIPkmciSgqL5sJwodHqU1fz0+U0dq8Wawud5eKgC0ntoww60
	viptin+Df00IqQqQ24QJfoeXxsXEuCExfQALiu2TIClkSoy0STN+tvo0DUU3h/a70q2U
	lSliPD9Chrwyz0kbD5DdhMOE8PkHa6MqgZTxXEERq8S+yqZj0Bd39b/3thUBZhIuIWcg
	ge0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=7A2+bnfbuKOJ/62LtmoPjOJKooXbWTjkt42933Lt8/E=;
	b=L3k35JmSjcdw/eaOVZBtcbMsX3ieqPfQnp4zbgEfaezdm17UFrCVKy5Za5NjJM+ZGM
	LLccd9H6DEeFthf+PsbI+I/gObawbVkyxX1BZBxwxG7MgpGUaBfXA5J0cfLhQR+VhoUh
	67DTeILMu9Rpnde4RxDUREKl2eb8bX3ECT16mqh8IH5S4WAwk5OPgomCGFQxYBw/oZBV
	G9w0tzoNCYk4WxUrxlZdAhsMDWjWiCV6CALoXxvgljgF3IyHnoWToHuXZmUI5BvIHd9k
	eZtko2wge+Y2/J0g6PVfwciMKeXfYRaOWnEu2rIepMsXRDezkE487N8csbJZFuUXuCdL
	Dh+g==
X-Gm-Message-State: AKS2vOztdUjekEZ98pI4uKHYuHpWqjvaQKiV7Jc8YZaDupnklBO4eM07
	XLv/HoJjnGFyhC7gGJtvq9XLV/NFMA==
X-Received: by 10.28.107.193 with SMTP id a62mr11584841wmi.122.1498438190475; 
	Sun, 25 Jun 2017 17:49:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.173.66 with HTTP; Sun, 25 Jun 2017 17:49:49 -0700 (PDT)
Received: by 10.223.173.66 with HTTP; Sun, 25 Jun 2017 17:49:49 -0700 (PDT)
From: Brownson Obele <brownson4u@gmail.com>
Date: Mon, 26 Jun 2017 09:49:49 +0900
Message-ID: <CAMLuUbUK2GqOgSRBS4YsPz+6G5spMiKcuxGi+mKOD+S9nC1OJg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Creating a python LDTP recipe for Yocto build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Jun 2017 00:49:50 -0000
Content-Type: text/plain; charset="UTF-8"

I'm a novice trying to package LDTP (https://github.com/ldtp/ldtp2) into a
recipe that i can add to my Yocto build image.

Has anyone already done or working in this?  Any help/guide/pointers on how
to get to do this will be greatly appreciated.

Perhaps people involved with creating the meta-python recipes can please
provide some form of a how-to. Just looking at the python modules that have
already been packaged into recipes isn't helping much.

Thanks a lot in advance.

Brownson

