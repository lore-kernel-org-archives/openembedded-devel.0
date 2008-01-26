Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mickey@vanille-media.de>) id 1JIZGG-0006xw-LJ
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Jan 2008 01:51:08 +0100
Received: from [192.168.1.105] (e180168123.adsl.alicedsl.de [85.180.168.123])
	by drlauer-research.com (Postfix) with ESMTP id 5CEE4584BC9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Jan 2008 01:54:36 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Jan 2008 01:51:12 +0100
User-Agent: KMail/1.9.7
References: <fnchem$8v4$1@ger.gmane.org>
In-Reply-To: <fnchem$8v4$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200801260151.13034.mickey@vanille-media.de>
Subject: Re: RFC: strip "-native" from $S for native packages automatically (bug 1856)
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
X-List-Received-Date: Sat, 26 Jan 2008 00:51:09 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 25 January 2008 12:33:39 Rolf Leggewie wrote:
> Hi,
>
> I elicit your comments on bug 1856, especially comment3.
>
> The bug is about stripping "-native" automatically from the S variable
> for native packages since it will hardly ever occur that a tar ball will
> unpack to $PN-native-$PV/  This would save us resetting $S manually for
> native packages all the time.  Koen suggested the fix to go into
> native.bbclass. When I revisited the bug today, I thought this must be
> as easy to fix as simply adding
>
>   export S=`echo $S|sed s/\-native\-/\-/`

That looks like an infinite recursion to me.
S:= ... may work, but I don't like launching a shell for that.

If we really want to have that (I'm -0 on that), I would rather propose

S = ${@"%s/%s" % ( bb.data.getVar("WORKDIR", d, 1), bb.data.getVar("P", d, 1).replace( "-native", "" ) ) }

-- 
Dr. Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de


