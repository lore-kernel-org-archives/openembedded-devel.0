Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OWDEw-00060O-4O
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Jul 2010 20:51:31 +0200
Received: by iwn34 with SMTP id 34so6915515iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jul 2010 11:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=VBiHFzFLToQa+cKxRlSRbZK4piO9dF1sU2mIA2ornEE=;
	b=BW8fjD7iUDOVKZDIUtpkKXGz93WJb2cplT1kvWw/8GjKtm+1gKENCjjKTUG1G/zxcL
	7oI46IcJEDJjM7u29HK8IitKN0adlVBwiCwypHo9fJxLlQTjCy1/ry4QyoiTTNAe6h+u
	NTl8CpzjksfOUln2mIsRtBe8ZkoLWrD4tHI34=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=vQFnltFwmijJGJ6JjvokvfQw3d+5UtvcnS5oczBRJuV+jY8Mps3c29JLUXDKALoDnt
	NN53R7MxCBC6qHHXsBSBBuMdOQsHDKG870Yf6XvC31fSHxcQo8DBkjBJR3yI+EUqiJo7
	hhDaIOFK3vNEV67PtXZiE+VtHaiYpHqPgsAfw=
Received: by 10.231.31.202 with SMTP id z10mr5182713ibc.85.1278441999815; Tue, 
	06 Jul 2010 11:46:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Tue, 6 Jul 2010 11:46:19 -0700 (PDT)
In-Reply-To: <1278439840.30247.3632.camel@rex>
References: <AANLkTik1mhR1trtNfJcNrehMg0gs2lNSXyp51PPpaSPu@mail.gmail.com> 
	<lyeifgcyxm.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1278439840.30247.3632.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Jul 2010 11:46:19 -0700
Message-ID: <AANLkTimI2cM6ehyfx2VQ3FnZiwxkl1SiXJG4Gf4gCGLR@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: native glibc-initial-2.9 unpack error
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
X-List-Received-Date: Tue, 06 Jul 2010 18:51:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 6, 2010 at 11:10 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Tue, 2010-07-06 at 19:17 +0200, Enrico Scholz wrote:
>> Jan Paesmans <jan.paesmans@gmail.com> writes:
>>
>> > cp: cannot create regular file `/ld.so.conf': Permission denied
>>
>> bb.decodeurl (bitbake 1.10) seems to be buggy:
>>
>> | >>> import bb
>> | >>> bb.decodeurl("file://ld.so.conf")
>> | ('file', '', 'ld.so.conf', '', '', {})
>> | >>> bb.decodeurl("file://etc/ld.so.conf")
>> | ('file', 'etc', '/ld.so.conf', '', '', {})
>> | >>> bb.decodeurl("file://etc/test/ld.so.conf")
>> | ('file', 'etc', '/test/ld.so.conf', '', '', {})
>>
>
> There was a fix recently added to bitbake master for this:
>
> http://git.openembedded.net/cgit.cgi/bitbake/commit/?id=ca257adc587bb0937ea76d8b32b654fdbf4192b8

right. OE needed a fix too
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=5ac52371b09a25518b60e23e80c8c812cdea6e36

which means that bitbake fix should also go
into 1.8 an 1.10 to keep building oe .dev with those versions of bitbake.


thx
-Khem


