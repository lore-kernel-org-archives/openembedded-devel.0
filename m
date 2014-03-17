Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 132DC6EEEE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 09:02:36 +0000 (UTC)
Received: from [192.168.178.14] (chello080108088242.14.11.vie.surfer.at
	[80.108.88.242]) by ptmx.org (Postfix) with ESMTPSA id 8C74922956
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 10:02:36 +0100 (CET)
Message-ID: <5326BAC9.40201@pseudoterminal.org>
Date: Mon, 17 Mar 2014 10:05:13 +0100
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Avoiding registration as shlib provider
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
X-List-Received-Date: Mon, 17 Mar 2014 09:02:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I have noticed the problem with GStreamer in current master: the many 
"xyz was registered as shlib provider" warnings.
Actually, it makes no sense to register the plugins, since they are, 
well, plugins. No other package must have a hard dependency on any of 
them. So, it would make sense to disable registration for the plugins. 
Is this possible?

cheers

