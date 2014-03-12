Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 7F7A46F763
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 13:48:57 +0000 (UTC)
Received: from [10.1.14.248] (unknown [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 4C98522931
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 14:48:58 +0100 (CET)
Message-ID: <532065C9.30300@pseudoterminal.org>
Date: Wed, 12 Mar 2014 14:48:57 +0100
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Using openembedded with externally built kernel
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Mar 2014 13:49:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I have a platform with a very barebones BSP that builds and patches a 
2.6 kernel using a whole lot of shell scripts and patch files.
Integrating this build process into a .bb file is too complicated at the 
moment.

Since cross compiling all packages I need is a nightmare to do manually, 
I wonder if I can get OE to use the prebuilt kernel along with
its kernel modules and headers instead of trying to build a new kernel. 
Ideally, I would just tell it where the kernel headers are, where
the uImage is, and where the modules are. I imagine this as some kind of 
kernel .bb file setting things up to not actually build anything.

My question is: is this possible? All I could find was about external 
toolchains and external kernel modules.

Carlos

