Return-Path: <cliff.brake@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0B5376E668
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2016 01:44:03 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id p64so14667721lfg.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Apr 2016 18:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to;
	bh=hp/FOG0lcAXHwD4mexCCXU9OtWhFdHq+eYIimTGGs/I=;
	b=KylfI41aIFZQI0Yljw6yo6OAKyZCbd5chi2oes/nakzQPvIpxdKio4aHj0xsvyImxP
	PozT1OrWl8DhM5I3/JLcxUFKiv08iBhyrN0J42/hDQWlvwm2IyV+wYzOgMvWwVr3DaOu
	1314/t9h4XX5KjZVUHJv9C1t6Rq0KK0GYwRoUbwNgYDXuwm9dBDmTjYlT0Bb1lA8gC+K
	uagfCx29qbmzrGClISqOpCgusNtuiHdwMoDx7zM1qd9dv8DahhZZHQNYrntuwPytBhwB
	9Cw9ASykRfMLssbJMwMdAJBPnDbf4IM2ue0XSF1DKgGBYqKQ8bGGI2fkKCzPRpPHVpa/
	XX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=hp/FOG0lcAXHwD4mexCCXU9OtWhFdHq+eYIimTGGs/I=;
	b=cVXAQe5xOpGQQNhRFPmkSOSaeKb1d/qrLwUOpp2bylRjm9fVPfP3rMc9ngD9F5gB5l
	LflDWzAMSCPH1o9zAx83y0XBv2rahkVjiLJaDJ0U+JZx1xqkEDf9O8ZDOtkyZFTz0ZAB
	ObpDrTbW0nO1dz6gmWHWHiysSpEzXPZorPRQvC9jXSIQD6oK4XJf64HxzLuZe1Uu9M6X
	0t4cyPPkremHAploULDvoiZc+cPpQl1E9bqzXIR+VUWo2zBzEVnwel/gENnKbex6rBsI
	yp3jFlfYFXNMGbLGlMtp4YJjHhFEgERtK+HUbKKTAZ7uR48q2OjqgRHwLCYp3UZ5yeHz
	1KiA==
X-Gm-Message-State: AOPr4FVWuJLyXXD6oBkX/MBBOgG6o78j8GK+1JULoK59PcZNGRPMnObNnIBIzPZlOgI84UiltuVyYYujukDUqA==
MIME-Version: 1.0
X-Received: by 10.112.2.104 with SMTP id 8mr7759473lbt.50.1460684642556; Thu,
	14 Apr 2016 18:44:02 -0700 (PDT)
Received: by 10.112.181.105 with HTTP; Thu, 14 Apr 2016 18:44:02 -0700 (PDT)
Date: Thu, 14 Apr 2016 21:44:02 -0400
Message-ID: <CAOd_LFyF5A_Xp5SGVM7cQXU=w3zhPeWsWVohb2V9VDVxMLwoTA@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: anyone using docker for OE builds?
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
X-List-Received-Date: Fri, 15 Apr 2016 01:44:05 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I've been using systemd-nspawn containers for OE builds for some
years, and lately have been investigating Docker.  Seems like useful
tool, but a little concerned about managing 35GB build trees in Docker
(I already ran my workstation out of disk space once).

Does anyone have any suggestions or tips for using Docker to host OE
builds -- especially the storage aspect?

Thanks,
Cliff

-- 
=================
http://bec-systems.com

