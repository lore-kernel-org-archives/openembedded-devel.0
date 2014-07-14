Return-Path: <olof.johansson@axis.com>
X-Greylist: delayed 354 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 14 Jul 2014 09:11:22 UTC
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id A77B770254
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 09:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id B30452E2BC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 11:05:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id rlOCgXdXFWZg
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 11:05:23 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id DC2E82E2CE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 11:05:23 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id C5BF0C3E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 11:05:23 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id BA12BC13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 11:05:23 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by thoth.se.axis.com (Postfix) with ESMTP id B7E6C34005
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 11:05:23 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (10.92.17.1) by xmail2.se.axis.com
	(10.0.5.74) with Microsoft SMTP Server id 8.3.342.0; Mon, 14 Jul 2014
	11:05:23 +0200
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)	id 7A3539C739; 
	Mon, 14 Jul 2014 11:05:23 +0200 (CEST)
Date: Mon, 14 Jul 2014 11:05:23 +0200
From: Olof Johansson <olof.johansson@axis.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20140714090523.GB23194@axis.com>
References: <1405318339-20529-1-git-send-email-rongqing.li@windriver.com>
	<53C394BF.3050708@windriver.com>
MIME-Version: 1.0
In-Reply-To: <53C394BF.3050708@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH][meta-perl] libxml-libxml-perl: add recipe
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
X-List-Received-Date: Mon, 14 Jul 2014 09:11:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 14-07-14 10:28 +0200, Hongxu Jia wrote:
> On 07/14/2014 02:12 PM, rongqing.li@windriver.com wrote:
> > +++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0116.bb
> 
> s/libxml-libxml-perl/libxml-perl/
> 
> How about rename the recipe with "libxml-perl" ?

This would break the naming convention, lib<distribution name>-perl. The
module is *actually* named XML::LibXML. Even though it looks strange, I
think it would be preferable to stick to the convention.

-- 
olofjn

