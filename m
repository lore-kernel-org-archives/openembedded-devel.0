Return-Path: <piotr.lewicki@elfin.de>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 243BD60119
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 09:50:19 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id u206so71917993wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 02:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=elfin-de.20150623.gappssmtp.com; s=20150623;
	h=to:from:subject:message-id:date:user-agent:mime-version;
	bh=Iv/GtibJcQ3JnQRA2j1W8n7tqOTc4A4jXTYhKXgTviU=;
	b=lbWIwQ+5rIA41TjRhg1/iCjeVnGLZf1roQfUjTGnI5BOXtp6JtaNhFSj7BY1BaxWBA
	6jtUHF/T8E+o7Kg2KOyswMV9winTwgmXNEa9/tdjPXtxI1uUo/AAluilZ5FHDvrJhqQG
	j41QejGyD60OptH6fSPrz1yl5x6Fpxo3k+CdZoDz980CEaNBeO5Mmlg4xUAW+jZucNye
	MB3nsHgBYjbwMygUXrC/TSl6l2QPT4dNbTZqO5pH1w0o5gWrLhGRQSloHrqXdch2JzDJ
	it1BfYIUzGf9mFWIjL41uwuHh7SAub/O+GJZ2490XQ2KuSMb7RqdQVvPoUYMJQLSanvu
	NtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version;
	bh=Iv/GtibJcQ3JnQRA2j1W8n7tqOTc4A4jXTYhKXgTviU=;
	b=Sw8iWNjBmNuoY4qXThJ6hhrD9oAQ1IVY/tGLMYZv11fXweUZWCZBhR3GnjJIqZX5Rm
	Uq8spVYBM7Qibq86fyzs5ET5QLAV00fyPDEFy/atshMyOWPhAvvtPEft7ZnoPmFrYI7q
	DuTmMym9/Q++hBSneOE4+S1a6d49FW+U0WwpzkIRrIMb4PraVfUfxUbXNAxqKs+PMKDv
	ETuyae5hKY6OvN7gAQXidk70ph5zNRtahED4vdYp7edg9mtU81c/f/gKMy1sPzuJ5Cru
	7Kv8L4F5LwTqwNBE4XmrSYCPu2I/k9u/LTfJF1KettiLHscDAcMfs+BpCHEIqagl60bK
	o6xg==
X-Gm-Message-State: AOPr4FXci4UzplCTjBRMY2G6tC41Q0LIwArxlhvuOXxRWWpTBbKX5lrQtnEKiupqraR8mw==
X-Received: by 10.194.179.200 with SMTP id di8mr7669166wjc.50.1461145820190;
	Wed, 20 Apr 2016 02:50:20 -0700 (PDT)
Received: from [192.168.2.129] (b2b-94-79-174-114.unitymedia.biz.
	[94.79.174.114]) by smtp.gmail.com with ESMTPSA id
	r204sm8710100wmg.20.2016.04.20.02.50.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Apr 2016 02:50:19 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
From: "piotr.lewicki" <piotr.lewicki@elfin.de>
Message-ID: <571750DA.5010307@elfin.de>
Date: Wed, 20 Apr 2016 11:50:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-multimedia] libav missing
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
X-List-Received-Date: Wed, 20 Apr 2016 09:50:20 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,
I'm trying to build some image for raspberry pi and one of my 
dependencies is "libav".
Unfortunately it's missing from "meta-openembedded".
I found a commit which says that it has been moved to oe-core, but I 
have also cloned "openembedded-core" and there is no "libav" either.
I'm using layers:
- meta-openembedded
- meta-raspberrypi
- openembedded-core
- poky
(all of them on master branches).

Could you help me locate a recipe for libav?


Thanks
Piotr Lewicki




commit 30ba23377ec568a58c43e466582506980b67baad
Author: Paul Eggleton <paul.eggleton@linux.intel.com>
Date:   Tue Aug 13 22:30:03 2013 +0000

     libav: remove

     This is now in OE-Core.

     Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>


