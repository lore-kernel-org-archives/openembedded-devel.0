Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PKXQ7-00052W-OV
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 15:31:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 5C6EF314AEDE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 15:29:54 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 6Ueooo7v+kgH
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 15:29:48 +0100 (CET)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 64C66314AED5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 15:29:48 +0100 (CET)
Message-ID: <4CEA7E5B.7070900@opendreambox.org>
Date: Mon, 22 Nov 2010 15:29:47 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CE6FA0C.2090801@balister.org>
	<4CE9332C.7020701@opendreambox.org>	<AANLkTim-vJEbUXtQtm4TQLbKBBrwG2m_tbao0u4kJuWu@mail.gmail.com>	<4CE95578.8000604@opendreambox.org>
	<AANLkTikc4Pm+kgyym+Qdd32R3gPo1HX4QtWE0yCf3ykb@mail.gmail.com>
In-Reply-To: <AANLkTikc4Pm+kgyym+Qdd32R3gPo1HX4QtWE0yCf3ykb@mail.gmail.com>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Merging the release branch into master (was: Re: Revert commit c2c8fe4c5629add94bd0b922f5b3446624a9f4d8)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Nov 2010 14:31:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 11/21/2010 06:55 PM, Chris Larson wrote:
> The release branch is being merged back to master after the release is
> tagged, FYI.

I've been thinking about it, but I'm not really sure what the point is
in that if all fixes should already be in master before entering the
release branch, except for maybe some release-branch specific stuff
(which in turn must not exist, because it would get merged into master
after release has been tagged)? You can't even put some release notes
into the release branch?

Also, a revert can be reverted again, if needed, before a merge, i.e.
revert, tag, release, unrevert, merge, delete.



