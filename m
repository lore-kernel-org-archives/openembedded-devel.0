Return-Path: <danismostlikely@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6F3A46E672
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Mar 2017 16:53:54 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id n37so10161354qtb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Mar 2017 09:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KiuMZHHiQov/m9gjfYNNNbqbI1sPpBscDN1TrYQyOHc=;
	b=Q4bDiX3ldox8XTqi5OdeNjSGEPXyE6ddForgO+15PSVrnetIgrrWEvw38VkAmgeMJP
	9lyVqmMlcqKnLO0/4tZhuJdxUNDZ4Yi+axvoW3GcY7e8+RxeFNXV5p6U9wikYHUzn0BH
	WVpDNZnsixB2C5OoNFU3/XtO4vlNMddIqc5Q58774r7c1VzxfcI9omt1NAAwm9MDy3j6
	fjdoYZ/KsQmxkglw+nDB2TiTIUA10GrQ6qrIiB5MVfVfKSr9Qz+8Spf8+P0tP56cq5XT
	nzJNYgW39vcxx9ASPfuK9Q1f9YzSGEgYRHhPLoOOlAv3qU3XhJlwyFoHLxAyKIbUBDHB
	I6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KiuMZHHiQov/m9gjfYNNNbqbI1sPpBscDN1TrYQyOHc=;
	b=fTXKHEIYGDLe0GFK0I/F9uQ5fcdK8ucKGDKY/LUqegmY5URUDUYYC0VruFfv/YcU86
	06KTcrCUBRe2r+eBjSUe2ZonP7ZC9NwZyOLiC5dZXCYMqRlH0Dahy82VMus7gLMnCVnu
	dRpcHdx5xWVDLmZcIXpkXODN9yGfZHKJe2/nshpKhET3dWa5DCpT2L8ul73dt9G0bgp2
	aIEfVi/hQh+VNQQmfKLRgwB6w4QA0UpZgrE4FDv52u6fbJj0mnMxiF2ZoFC+TGSkLm/v
	xWlxWw/fX10WDAG5REUW2AjS4ibI9rzpeRTP3VrXLWsUp0+JsVXavVtkYzt/LFRpQ8+8
	CGjg==
X-Gm-Message-State: AFeK/H3qwQXisYxZ//ME8GVdkPR1yrgnYmL71GtwTaORMcbj/P2t74hKaLxr5ZFxSI5BIe1O43DuDl48cR9Qyg==
X-Received: by 10.200.50.199 with SMTP id a7mr14574708qtb.95.1489769636086;
	Fri, 17 Mar 2017 09:53:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.77.18 with HTTP; Fri, 17 Mar 2017 09:53:55 -0700 (PDT)
In-Reply-To: <20170317134404.GA21032@mbabyjoh-desk.ger.corp.intel.com>
References: <1489396937-21461-1-git-send-email-maxin.john@intel.com>
	<CACS+7ZT=qTVr=mhaG97YCyPOps4mOhcSS6=g6CPs=BEpSHna9w@mail.gmail.com>
	<20170317134404.GA21032@mbabyjoh-desk.ger.corp.intel.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Fri, 17 Mar 2017 10:53:55 -0600
Message-ID: <CACS+7ZRXCtkpMr37WcxGd3cY7VR6sZ+qEABNbusPdLiVUfP2OQ@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] jikes: fix absolute symlink error
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
X-List-Received-Date: Fri, 17 Mar 2017 16:53:55 -0000
Content-Type: text/plain; charset=UTF-8

On 17 March 2017 at 07:44, Maxin B. John <maxin.john@intel.com> wrote:
> Hi Dan,
>
> On Thu, Mar 16, 2017 at 10:42:43AM -0600, Dan McGregor wrote:
>> On 13 March 2017 at 03:22, Maxin B. John <maxin.john@intel.com> wrote:
>> > The following oe-core commit made asbolute symlink an error:
>> >
>> > commit 3eee8e99e114b3db8b718834ca52da8d2919b83f
>> > sstate: Make absolute symlinks an error
>> >
>> > Fix this by inheritting relative_symlinks class:
>> > ERROR: jikes-native-1.22-r0 do_populate_sysroot: sstate found an
>> > absolute path symlink
>> >
>> > Signed-off-by: Maxin B. John <maxin.john@intel.com>
>> > ---
>> >  recipes-core/jikes/jikes_1.22.bb | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/recipes-core/jikes/jikes_1.22.bb b/recipes-core/jikes/jikes_1.22.bb
>> > index 0c33118..a35cfcf 100644
>> > --- a/recipes-core/jikes/jikes_1.22.bb
>> > +++ b/recipes-core/jikes/jikes_1.22.bb
>> > @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
>> >                     "
>> >  SRC_URI = "${SOURCEFORGE_MIRROR}/jikes/jikes-${PV}.tar.bz2"
>> >
>> > -inherit autotools update-alternatives
>> > +inherit autotools update-alternatives relative_symlinks
>> >
>> >  BBCLASSEXTEND = "native"
>> >
>> > --
>> > 2.4.0
>> >
>>
>> This change makes the layer depend on master, not krogoth or master
>> like the README says. Should we add the relative_symlinks
>> functionality locally, or update the README?
>
> You are right. This functionality depends on the master branch. It also
> reminds me that meta-java has been particularly bad in keeping up with
> branching of oe-core releases.
>
> I have been testing some patches to remove "meta-oe" dependency for
> "meta-java" layer (PACKAGECONFIG way). Will update README along that
> patchset. Hope that is ok.
>

It works for me. We're currently using krogoth, but plan to move to
master after it's branched. We can keep using an older snapshot of
meta-java for now.

Thanks.

> Best Regards,
> Maxin

