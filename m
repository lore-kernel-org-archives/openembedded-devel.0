Return-Path: <mike.looijmans@topic.nl>
Received: from smtp01.mail.online.nl (smtp01.mail.online.nl [194.134.25.71])
	by mail.openembedded.org (Postfix) with ESMTP id 0772060290
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 10:34:04 +0000 (UTC)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp01.mail.online.nl (Postfix) with ESMTP id F2D454000C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 11:34:03 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <5683B31B.4090103@topic.nl>
Date: Wed, 30 Dec 2015 11:34:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
Subject: Why does samba think it (R)DEPENDS on perl?
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
X-List-Received-Date: Wed, 30 Dec 2015 10:34:05 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

When building the current version of samba, it builds perl and drags it 
into the image through an RDEPENDS.

I've been researching this for a while, but failed to figure out what 
causes this runtime relation. Is there a way to find out where this is 
being "detected"?

The workaround I implemented is simply adding this line to the samba 
recipe, which at least gets rid of the overhead in the image:

RDEPENDS_${PN}_remove = "perl"

(Samba 4 is bloated enough by itself, it doesn't need other packages to 
inflate its runtime even more)

-- 
Mike Looijmans

