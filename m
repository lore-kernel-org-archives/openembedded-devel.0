Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0D66575E2D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Aug 2019 14:55:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 462yPD4HpVz65;
	Tue,  6 Aug 2019 16:55:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1565103344;
	bh=us5izhZAJsnOMnApE3x159MPJK4BKAG0AmbxejkkAMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bC5UNu2ey0SSucas5N3dBwRCJDWEEnxVse4kUHoKDTrjdXRriex7t5LAphH05EZcL
	ny5SHWysmmnKVnA3TozGYLdZ8ZBPmJGzr87xE+GP+HuxVy7WHkuR55+l7TGWH3jb0/
	16qynuzghSz7PyPnbDEaOcZD7qdhagdACCuJm4xoNPCmiF+XIHslqTZVpsl8U0B+ld
	3FRM09cz+Yu2sgujtFszgAoE+nxn9TzbtLCEDzKdQeoXHZiSWIT8hssgQkKZS2Tx8P
	fzpIXzkDc5dqKvIF4/yt++WavQ0YCkTY6IqOAXGNmzC6EVBakqaS5h1FdMiypGD4yF
	JUml7lzxttUQcWq2h8VGJEhCUefBuI2+5t9TmJbKh9W898i6C+KuGIyFt29wpAdmAu
	AZf2uRRRO4pmpExLo+yuak8XlFi/qBlE4SHVoGr72QXgo3v1p0XkE3XMKa7nWgZl9s
	ZPojLQu4854E/3bJ7PdszWumA04DIJBBcLV14/GPetQ93Po1/36veUBiwjFCJatOUe
	0fhFJ3lpLRrGd1XZ3lnQS18KGip5rzMb2VsFVfCBIpTjz9jbz6uRCPvhzJsfEDKcT/
	ZADXjxHnVFbh3JBE66kgJDSLEDPkqIz8f8Nowm4VspYdCWs2O3Vfouah+GiQ+K1yxB
	yuFtA/cQjVwMpWbbWV4yhqzA=
Date: Tue, 6 Aug 2019 17:55:42 +0300
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190806145542.GA19671@localhost>
References: <20190805182453.30420-1-bunk@stusta.de>
	<CAMKF1sqH_1E-2KpyMBYs3r3iSdmjKBv9dM=yT9PP+t0DOqos1Q@mail.gmail.com>
	<20190806064312.GA12298@localhost>
	<ce6dc916-68a8-377b-4fdb-4ee4d2ed8744@gmail.com>
MIME-Version: 1.0
In-Reply-To: <ce6dc916-68a8-377b-4fdb-4ee4d2ed8744@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] wireshark: Use an upstream URL that stays valid longer
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
X-List-Received-Date: Tue, 06 Aug 2019 14:55:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Aug 06, 2019 at 07:43:34AM -0700, akuster808 wrote:
> 
> 
> On 8/5/19 11:43 PM, Adrian Bunk wrote:
> > On Mon, Aug 05, 2019 at 12:13:14PM -0700, Khem Raj wrote:
> >> On Mon, Aug 5, 2019 at 11:25 AM Adrian Bunk <bunk@stusta.de> wrote:
> >>> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> >>> ---
> >>>  meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb b/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
> >>> index d442925ee..efcd5e42e 100644
> >>> --- a/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
> >>> +++ b/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
> >>> @@ -8,7 +8,7 @@ DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bi
> >>>
> >>>  DEPENDS_append_class-target = " wireshark-native chrpath-replacement-native "
> >>>
> >>> -SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz"
> >>> +SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz"
> >> perhaps use BP instead of wireshark-${PV}. Can you make that change as
> >> well while you are here.
> > I was aiming at a minimal change, since backporting to warrior is
> > where it is urgently needed (can't build wireshark there right now).
> 
> Would defining a MIRROR help ?  IIRC a new release of wireshark may not
> always be in the "all-versions".

"all" seems to actually mean all here.

And the problem you describe would anyways not happen suddenly during
a stable series.

> - armin

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


