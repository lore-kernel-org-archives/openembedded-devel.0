Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LewfP-0007Sh-NA
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 20:22:11 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090304191751.RKJD15318.fed1rmmtao105.cox.net@fed1rmimpo02.cox.net>;
	Wed, 4 Mar 2009 14:17:51 -0500
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id P7Hr1b00U4dMFYL047HrW5; Wed, 04 Mar 2009 14:17:51 -0500
X-Authority-Analysis: v=1.0 c=1 a=YohJiyLUb4EA:10 a=9ZRQWrMggegA:10
	a=Js0LpgGrAAAA:8 a=b_OEaAMLAAAA:8 a=fGO4tVQLAAAA:8
	a=HGVZKLU8xKzQ9sFw3tgA:9
	a=DlQZ4W33_vSRF9lv8wPWKaQ92aMA:4 a=LY0hPdMaydYA:10 a=_qZRxRWV73kA:10
X-CM-Score: 0.00
Date: Wed, 4 Mar 2009 12:17:51 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090304191751.GV26343@smtp.west.cox.net>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
	<1236182004-4523-3-git-send-email-openembedded@haerwu.biz>
MIME-Version: 1.0
In-Reply-To: <1236182004-4523-3-git-send-email-openembedded@haerwu.biz>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: Richard Purdie <richard@openedhand.com>
Subject: Re: [PATCH 02/70] rpm/rpm-native: Add recipe for 4.4.2.3	(from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 19:23:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 04, 2009 at 04:52:17PM +0100, Marcin Juszkiewicz wrote:

> From: Richard Purdie <richard@openedhand.com>
> 
> git-svn-id: https://svn.o-hand.com/repos/poky@5069 311d38ba-8fff-0310-9ca6-ca027cbcb966
> ---
>  packages/rpm/files/cross_libpaths.patch |  145 +++++++++++++++++++++++++++++++
>  packages/rpm/files/external-tools.patch |  108 +++++++++++++++++++++++
>  packages/rpm/rpm-native_4.4.2.3.bb      |   10 ++
>  packages/rpm/rpm_4.4.2.3.bb             |   84 ++++++++++++++++++

rpm-native's configure depends on 'ed' being on the host.  We don't
currently check for this in sanity.bbclass nor have an ed-native package
which can be added to DEPENDS.

See http://pastebin.com/m1ea52c95, MACHINE=nokia800 (but I also see it
for db1200 and beagleboard and mx31ads) DISTRO=minimal.

-- 
Tom Rini


