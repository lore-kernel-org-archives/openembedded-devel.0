Received: from gv-out-0910.google.com ([216.239.58.184])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Nu6Wx-0006lN-54
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 17:00:36 +0100
Received: by gv-out-0910.google.com with SMTP id o2so166049gve.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 08:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=2lyjDGG7A/sIEPUYUlQykdsG5c2ul3toPqlSsJDB6p0=;
	b=cXwMwNVhyWl0yCl5LvTh9Thko09OPvfN8VLxt2KZLyDCsASzyYWVRUSZADxW1dXJIN
	THFY8YcLSdLzyK4FU9iQ/Brq/iYCZFWPulm5CuW74LUPXGXWCKaOOBQ7GHF05YeQom4a
	C8eDrw96/x5DwZtp6hckwJcT/sU+iCOop2wpM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ktvsBjp2t50GaxG1P7xvBi33PqsorD7+Ba0hRw5FOzev1HqN8x6lCg6+PE2suZ9QLc
	fDEvd8agsh5BJMRK1czbBvpi8iwJhnUbhxIZbIjgrDytASDXPAjgmvVWTDahvSp+ngip
	9wpFer9nsidyQXRgg678/HlDUcZb/3WltC2SA=
Received: by 10.102.14.25 with SMTP id 25mr1475448mun.30.1269359847894;
	Tue, 23 Mar 2010 08:57:27 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id s10sm5410597muh.35.2010.03.23.08.57.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 23 Mar 2010 08:57:26 -0700 (PDT)
Date: Tue, 23 Mar 2010 16:57:00 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100323155700.GF21210@jama>
References: <b6ebd0a51003221526y7c47c57esd7bc14cc5e85f893@mail.gmail.com>
	<20100323094757.GE21210@jama>
	<b6ebd0a51003230841g5fa61480t6330eda0d27596d2@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <b6ebd0a51003230841g5fa61480t6330eda0d27596d2@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 216.239.58.184
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: BBVERSIONS
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
X-List-Received-Date: Tue, 23 Mar 2010 16:00:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 23, 2010 at 08:41:14AM -0700, Chris Larson wrote:
> I also agreed that it's nicer to duplicate a tiny amount of metadata than to
> have a giant file full of overrides, but with BBVERSIONS, you could keep
> every minor version of a given major version around.  Keep one recipe per
> major version, just keep all the minor versions around.  It really doesn't
> take that long to fire off a loop that builds all variants, I have a script
> for it - bitbake sets a variable that lists them all, but like I said in the
> start of the thread, personally, I'd rather see the versions available, and
> relatively easy to fix if they break, than either remove them entirely or
> let their recipes bitrot.  That's my personal opinion, of course, I'm sure
> others disagree.. but I do think this feature could be useful, even if we
> don't keep every version around, since it makes it easier to share metadata
> across multiple versions without having to create a pile of extra .inc's.
>  foo.inc and foo_ver.bb is great, foo_1.x.inc, etc gets messy fast.

Yeah loop is easy for build test, but it doesn't say anything about how
it works on device.

From my POV existance of foo_1.3.2.bb signs that at least someone used
it in some point in time on some device and it was usefull for him, but
existance of 1.3.2 in some version range doesn't show which minor was
tested/used and which was added automagically because of BBVERSIONS
existence.

Again it's also my limited imagination and if it's used only for recipes
which existed before in OE and were almost the same, it can save few files 
which is nice.

Not sure how zecke's audit script and resulting cleanup/fix-up for whole
tree will work when BBVERSIONS extends available versions with some
vulnerable minor version and nobody will be willing to backport security
patch from latest.

Just my 2c.

Regards,
-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


