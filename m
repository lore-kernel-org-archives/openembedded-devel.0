Received: from [62.169.194.60] (helo=cp3a.criticalpath.priv)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <skoroneos@digital-opsis.com>) id 1HMKT8-0000Rx-DV
	for openembedded-devel@openembedded.org; Wed, 28 Feb 2007 09:47:26 +0100
Received: from dias (62.169.211.226) by cp3a.criticalpath.priv (7.3.118.3)
	id 45DF0D5500039C1A for openembedded-devel@openembedded.org;
	Wed, 28 Feb 2007 10:46:36 +0200
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: <openembedded-devel@openembedded.org>
Date: Wed, 28 Feb 2007 10:47:23 +0200
Message-ID: <HOECLKEKOHLAMMGDLLBHOECKKEAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3028
In-Reply-To: <d46153c40702270854k14f92b56x1c31eafdbea7b6e2@mail.gmail.com>
Importance: Normal
Subject: Re: RFC: madwifi-ng patch rationalisation and version update
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Feb 2007 08:47:26 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

The problem originally was created as i used an older version of
madwifi-ng_r.inc to make the updates.
We managed to resolve it thanks to the help of rwhitby.

One the the things that came out of this,was that several packages contain
arch specific definitions and patches that get applied by default, whether
the package gets build for that specific architecture/machine or not.
In many circumstances this is not noticable, in others (like this) is.
Since support for more architectures/machines is happing we need to have a
more close look on this or we will end up with a lot unhappy situations.

Stelios





