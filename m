Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 496D5719B5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 10:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id D00EA180E6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 11:21:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id mTK535f95XYE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 11:21:11 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 6D2FC18119
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 11:21:11 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B1C91A064
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 11:21:11 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 505391A060
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 11:21:11 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 11:21:11 +0100 (CET)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by thoth.se.axis.com (Postfix) with ESMTP id 44DEF2C6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 11:21:11 +0100 (CET)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id 2ADED9C09F; Fri, 20 Jan 2017 11:21:11 +0100 (CET)
Date: Fri, 20 Jan 2017 11:21:11 +0100
From: Olof Johansson <olof.johansson@axis.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170120102110.GR31993@axis.com>
References: <1482363538-28271-1-git-send-email-derek@asterius.io>
	<CAFZh4h81OfiN9UXDM-cZyqUexaBStK16LHSg8zPu00d9t4+27w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFZh4h81OfiN9UXDM-cZyqUexaBStK16LHSg8zPu00d9t4+27w@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
Subject: Re: [meta-webserver][PATCH] apache2: update to version 2.4.25
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
X-List-Received-Date: Fri, 20 Jan 2017 10:21:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 17-01-11 08:52 -0500, Brian Hutchinson wrote:
> On Wed, Dec 21, 2016 at 6:38 PM, Derek Straka <derek@asterius.io> wrote:
> >  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.23.bb => apache2_2.4.25.bb} (97%)
> 
> How long does it typically take for something like this to show up in
> the Krogoth (2.1.2) and Morty (2.2) branch?
> 
> Just wondering because I did a fresh checked of both yesterday and
> they didn't have this fix yet.

The change bumps to a newer version (even skipping one
intermediate release). This is typically not something that would
be integrated to a stable branch (although I haven't looked
closer at the difference between the versions).

But I just sent patches for krogoth and morty to change the
SRC_URI to point to archive.apache.org instead as the 2.4.23
tarball has been moved.

If you want the later upstream version while still staying on
Krogoth/Morty, I think you'll have to make a local backport.

Hope this helps,
-- 
olofjn

