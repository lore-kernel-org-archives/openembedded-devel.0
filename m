Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OfzQQ-0007Wp-W4
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Aug 2010 20:07:48 +0200
Received: by bwz10 with SMTP id 10so1990115bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Aug 2010 11:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=4HqHU+/NMeeXruUPY24ej1KeDCBZZT+39dBCoPh5WzU=;
	b=JNliCHf53Dkwu2mmUPeH6qSXk6zRJLu3RA9LrfKrsDMAN0X3ripDT2wl+tMPZdusgX
	MYaE8GLj+0Vspfnd9JxhAu76jFuGhnzUZEpK5LgXpS/I9giq9jYbVQVpmJsx8iE+pqyt
	/rT30rCHIFKIfvtXmHSmddVsWLK+ZNRTAOS98=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=FvImdDmjjFFK02ce/sH49whlX2rKz8L7AXOE9fSOuf9r2e13GnnQcq7Kqmuhlty4o2
	cG0X20Yxnae2bJLUQy0us6o4imOTHq4zHeHpQxCwtKp0/h4WptpXKS9wE0hcHSOEntw3
	HCsCW1OQsU0esBdlLnjHdS8uPkb//POZipytg=
Received: by 10.204.162.207 with SMTP id w15mr4381122bkx.63.1280772444945;
	Mon, 02 Aug 2010 11:07:24 -0700 (PDT)
Received: from s42.loc (85-127-241-5.dynamic.xdsl-line.inode.at [85.127.241.5])
	by mx.google.com with ESMTPS id 24sm4304939bkr.7.2010.08.02.11.07.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 02 Aug 2010 11:07:24 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OfzPw-0001cs-Pl; Mon, 02 Aug 2010 20:07:16 +0200
Date: Mon, 2 Aug 2010 20:07:16 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100802180716.GG29814@mx.loc>
References: <1280309434.7083.8.camel@utx.lan> <4C503315.8090009@gmail.com>
	<20100728140613.GB19135@mx.loc> <20100728143208.GC19135@mx.loc>
	<20100802171317.GF29814@mx.loc> <20100802174910.GA1503@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20100802174910.GA1503@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
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
X-List-Received-Date: Mon, 02 Aug 2010 18:07:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 02, 2010 at 10:49:10AM -0700, Khem Raj wrote:
>On (02/08/10 19:13), Bernhard Reutner-Fischer wrote:
>> On Wed, Jul 28, 2010 at 04:32:08PM +0200, Bernhard Reutner-Fischer wrote:
>> >On Wed, Jul 28, 2010 at 04:06:13PM +0200, Bernhard Reutner-Fischer wrote:
>> >>On Wed, Jul 28, 2010 at 03:39:33PM +0200, Marco Cavallini wrote:
>> >>>Stanislav Brabec ha scritto, Il 28/07/2010 11:30:
>> 
>> comments on the attached RFC patch?
>> TIA,
>
>-snip-
>> @@ -420,12 +424,16 @@ python () {
>>  
>>      # unzip-native should already be staged before unpacking ZIP recipes
>>      need_unzip = bb.data.getVar('NEED_UNZIP_FOR_UNPACK', d, 1)
>> -    src_uri = bb.data.getVar('SRC_URI', d, 1)
>>  
>> -    if ".zip" in src_uri or need_unzip == "1":
>> +    if ".zip" in srcuri or need_unzip == "1":
>>          depends = bb.data.getVarFlag('do_unpack', 'depends', d) or ""
>>          depends = depends + " unzip-native:do_populate_sysroot"
>>          bb.data.setVarFlag('do_unpack', 'depends', depends, d)
>> +    for ext in ['xz']: #['gzip', 'bzip2', 'xz']:
>> +        if '.' + ext in srcuri:
>> +            depends = bb.data.getVarFlag('do_unpack', 'depends', d) or ""
>> +            depends += ' ' + ext + '-native:do_populate_sysroot'
>> +            bb.data.setVarFlag('do_unpack', 'depends', depends, d)
>
>what does above hunk do.

srcuri=proto://some.thing.tar.xz
if ".xz" in srcuri then depend do_unpack on '
xz-native:do_populate_sysroot'

Re-reading the hunk it should better read:
  import re
  for (ext,tool) in [('xz','xz')]: # ('gz','gzip'),('bz','bzip2')
    rex = re.compile('.*\.' + ext + '$')
    if rex.match(srcuri):
      depends = bb.data.getVarFlag('do_unpack', 'depends', d) or ""
      depends += ' ' + tool + '-native:do_populate_sysroot'
      bb.data.setVarFlag('do_unpack', 'depends', depends, d)

>in general approach looks ok to me. It would be nice that while you are at
>it other packages which are needed early like git etc can use this approach
>as well.

Agree. One step at a time, let's first handle the unpackers though, k?


