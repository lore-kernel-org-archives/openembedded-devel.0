Return-Path: <denis@denix.org>
X-Greylist: delayed 3610 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 12 Aug 2015 19:37:54 UTC
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id 15041607A4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2015 19:37:54 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NSZ00ID3FQJCI00@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	12 Aug 2015 13:37:40 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=XYJHFtupD_QA:10 a=-9mUelKeXuEA:10
	a=kj9zAlcOel0A:10 a=uRRa74qj2VoA:10	a=NEAV23lmAAAA:8
	a=R9nrDnf5_HdaI5WvzX0A:9 a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id EBFA9161B75; Wed,
	12 Aug 2015 14:37:30 -0400 (EDT)
Date: Wed, 12 Aug 2015 14:37:30 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20150812183730.GG26375@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: [meta-qt5] qtbase_5.4.2 do_install fails to chown fonts
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
X-List-Received-Date: Wed, 12 Aug 2015 19:37:57 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Hi,

Has anyone seen the issue of qtbase_5.4.2 failing at the end of do_install to 
chown fonts? Here's the message:

chown: cannot access `[cut]/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/image//usr/lib/fonts': No such file or directory

Here's the code that fails:

https://github.com/meta-qt5/meta-qt5/blob/master/recipes-qt/qt5/qtbase_git.bb#L230

Looking at the install location, it seems that the previous command

cp -a ${S}/lib/fonts ${D}/${OE_QMAKE_PATH_LIBS}

copied font files not into /usr/lib/fonts, but instead into /usr/lib directly. 
This usually happens with "cp -a" when /usr/lib destination is empty...

I'm thinking about submitting a patch that replaces above copy with:

mkdir -p ${D}/${OE_QMAKE_PATH_LIBS}/fonts
cp -a ${S}/lib/fonts/* ${D}/${OE_QMAKE_PATH_LIBS}/fonts

Any objections, comments, suggestions?

-- 
Denys

