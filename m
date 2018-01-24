Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id B241D7855C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 11:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id ABE2131C49F5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 12:44:44 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 0lI2aMqybWyg
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 12:44:42 +0100 (CET)
Received: from t460p (p4FE9ACAE.dip0.t-ipconnect.de [79.233.172.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 35B6931C4239
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 12:44:41 +0100 (CET)
Date: Wed, 24 Jan 2018 12:44:40 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20180124124440.38d77839@t460p>
In-Reply-To: <e79fca87-a7ea-cd80-7fe1-b3815cdef0db@gmail.com>
References: <1513002095-5152-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CAMKF1srSpv3GbrkHrLej6uEB0ikyE77LV4h4w-c0BoWaCfM0Kg@mail.gmail.com>
	<20180124005848.208d7757@t460p>
	<e79fca87-a7ea-cd80-7fe1-b3815cdef0db@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-networking][PATCHv2] samba: Add packagegroup
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
X-List-Received-Date: Wed, 24 Jan 2018 11:44:44 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 23 Jan 2018 23:25:11 -0600
Khem Raj <raj.khem@gmail.com> wrote:

> On 1/23/18 5:58 PM, Andreas Oberritter wrote:
> > On Tue, 23 Jan 2018 09:48:14 -0600
> > Khem Raj <raj.khem@gmail.com> wrote:
> >   
> >> On Mon, Dec 11, 2017 at 8:21 AM, zhengrq <zhengrq.fnst@cn.fujitsu.com> wrote:  
> >>> Add packagegroup for samba, for there are too many rpms in samba and it's hard to manage.
> >>>
> >>> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> >>> ---
> >>>  .../recipes-connectivity/samba/samba_4.6.7.bb         | 19 ++++++++++++++++++-
> >>>  1 file changed, 18 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb b/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
> >>> index 2b227c9..0bacb02 100644
> >>> --- a/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
> >>> +++ b/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
> >>> @@ -162,7 +162,7 @@ PACKAGES =+ "${PN}-python ${PN}-pidl \
> >>>               ${PN}-dsdb-modules ${PN}-testsuite registry-tools \
> >>>               winbind \
> >>>               ${PN}-common ${PN}-base ${PN}-ctdb-tests \
> >>> -             smbclient"
> >>> +             smbclient ${PN}-client ${PN}-test"
> >>>
> >>>  python samba_populate_packages() {
> >>>      def module_hook(file, pkg, pattern, format, basename):
> >>> @@ -254,3 +254,20 @@ FILES_smbclient = "${bindir}/cifsdd \
> >>>
> >>>  RDEPENDS_${PN}-pidl_append = " perl"
> >>>  FILES_${PN}-pidl = "${bindir}/pidl ${datadir}/perl5/Parse"
> >>> +
> >>> +SUMMARY_${PN}-client = "samba client"
> >>> +RDEPENDS_${PN}-client = "\
> >>> +    smbclient \
> >>> +    winbind \
> >>> +    registry-tools \
> >>> +    ${PN}-pidl \
> >>> +    "
> >>> +
> >>> +ALLOW_EMPTY_${PN}-client = "1"
> >>> +
> >>> +RDEPENDS_${PN}-test = "\
> >>> +    ${PN}-ctdb-tests \
> >>> +    ${PN}-testsuite \
> >>> +    "
> >>> +
> >>> +ALLOW_EMPTY_${PN}-test = "1"    
> >>
> >> perhaps better to add a packagegroup recipe explicitly  
> > 
> > How would a packagegroup be useful for a single recipe? We discussed this
> > back in December:  
> 
> why does single recipe matter ?

Because the most simple form of a group of packages is a meta package in the
recipe creating the packages. And simple, in case of doubt, wins against
complicated.

Regards,
Andreas

> 
> > 
> > http://lists.openembedded.org/pipermail/openembedded-devel/2017-December/115888.html
> > 
> > Regards,
> > Andreas
> >   
> 


