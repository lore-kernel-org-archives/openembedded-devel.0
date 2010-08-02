Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OfzWk-0007jh-1x
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Aug 2010 20:14:19 +0200
Received: by pxi12 with SMTP id 12so1485872pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Aug 2010 11:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Zv9FqTnMddEAMNFYbEQAvwP5FeQx12CMIkJ47uIZOVA=;
	b=KdiakWrMkbo5s3nwXetOc5uKbma+JfUgE0JyMKaSQ3TN/H13Wc1U8FcvPfzgp67+JU
	QwxsbuNX3AypPz3zHi0VmAga5vxCpE5oWjnrGIC+biwOiQT2OW8v6XLDe2Ktkk94SQ+o
	g4Da3ZAi0r7v5gWTDkC3WVu/ju0hwiyv7F2oE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=bh0amQ9dd3BOPP+Uyiz61k+cK8QpmAY793MKBa75PlDnz4wgxiQ1QmHC1ZYLMQtdqr
	vbw6gu0nOjCwck/7DHjDSG9i4HGAHvbzUCwPTwLBr6Dz86WeL2j3Iw6gVkD3FcrCens0
	ExLIW9kh/IuIlNxPquZtY1sDeNXagxiQjVodY=
Received: by 10.114.89.11 with SMTP id m11mr4247271wab.150.1280772833139;
	Mon, 02 Aug 2010 11:13:53 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id g4sm11876863wae.14.2010.08.02.11.13.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 02 Aug 2010 11:13:51 -0700 (PDT)
Date: Mon, 2 Aug 2010 11:13:43 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100802181343.GA1513@gmail.com>
References: <1280309434.7083.8.camel@utx.lan> <4C503315.8090009@gmail.com>
	<20100728140613.GB19135@mx.loc> <20100728143208.GC19135@mx.loc>
	<20100802171317.GF29814@mx.loc> <20100802174910.GA1503@gmail.com>
	<20100802180716.GG29814@mx.loc>
MIME-Version: 1.0
In-Reply-To: <20100802180716.GG29814@mx.loc>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH, RFC]: automatically depend xz compressed URIs on xz-native [was: Re: bitbake: staging of binary over symlink breaks sysroot (lzma x xz)]
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
X-List-Received-Date: Mon, 02 Aug 2010 18:14:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (02/08/10 20:07), Bernhard Reutner-Fischer wrote:
> On Mon, Aug 02, 2010 at 10:49:10AM -0700, Khem Raj wrote:
> >On (02/08/10 19:13), Bernhard Reutner-Fischer wrote:
> >> On Wed, Jul 28, 2010 at 04:32:08PM +0200, Bernhard Reutner-Fischer wrote:
> >> >On Wed, Jul 28, 2010 at 04:06:13PM +0200, Bernhard Reutner-Fischer wrote:
> >> >>On Wed, Jul 28, 2010 at 03:39:33PM +0200, Marco Cavallini wrote:
> >> >>>Stanislav Brabec ha scritto, Il 28/07/2010 11:30:
> >> 
> >> comments on the attached RFC patch?
> >> TIA,
> >
> >-snip-
> >> @@ -420,12 +424,16 @@ python () {
> >>  
> >>      # unzip-native should already be staged before unpacking ZIP recipes
> >>      need_unzip = bb.data.getVar('NEED_UNZIP_FOR_UNPACK', d, 1)
> >> -    src_uri = bb.data.getVar('SRC_URI', d, 1)
> >>  
> >> -    if ".zip" in src_uri or need_unzip == "1":
> >> +    if ".zip" in srcuri or need_unzip == "1":
> >>          depends = bb.data.getVarFlag('do_unpack', 'depends', d) or ""
> >>          depends = depends + " unzip-native:do_populate_sysroot"
> >>          bb.data.setVarFlag('do_unpack', 'depends', depends, d)
> >> +    for ext in ['xz']: #['gzip', 'bzip2', 'xz']:
> >> +        if '.' + ext in srcuri:
> >> +            depends = bb.data.getVarFlag('do_unpack', 'depends', d) or ""
> >> +            depends += ' ' + ext + '-native:do_populate_sysroot'
> >> +            bb.data.setVarFlag('do_unpack', 'depends', depends, d)
> >
> >what does above hunk do.
> 
> srcuri=proto://some.thing.tar.xz
> if ".xz" in srcuri then depend do_unpack on '
> xz-native:do_populate_sysroot'
> 
> Re-reading the hunk it should better read:
>   import re
>   for (ext,tool) in [('xz','xz')]: # ('gz','gzip'),('bz','bzip2')
                                     ^

that will turn the rest into comment is that ok ?          


>     rex = re.compile('.*\.' + ext + '$')
>     if rex.match(srcuri):
>       depends = bb.data.getVarFlag('do_unpack', 'depends', d) or ""
>       depends += ' ' + tool + '-native:do_populate_sysroot'
>       bb.data.setVarFlag('do_unpack', 'depends', depends, d)
> 
> >in general approach looks ok to me. It would be nice that while you are at
> >it other packages which are needed early like git etc can use this approach
> >as well.
> 
> Agree. One step at a time, let's first handle the unpackers though, k?
> 

yes however I wanted to keep this in notice.
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


