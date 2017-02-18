Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 0F2316078E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 20:08:33 +0000 (UTC)
Received: from [172.16.1.14] (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 53E8330F37
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 21:08:32 +0100 (CET)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <ace37025-faef-4ffe-1e02-e3a1ad52ff03@pseudoterminal.org>
Date: Sat, 18 Feb 2017 21:08:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
Subject: [morty][meta-openembedded] Commit backport required
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
X-List-Received-Date: Sat, 18 Feb 2017 20:08:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

commit d361ef01a9a61cd8a83f7728f7d3e9f118233cb8 "nis, opencv: Update 
getVar/setVar syntax" needs to be backported to meta-openembedded's 
morty branch. Otherwise builds break, because the deprecated bb.data API 
was removed also in morty.


