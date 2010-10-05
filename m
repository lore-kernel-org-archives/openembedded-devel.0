Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P3CNG-0001Jj-I7
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 20:36:42 +0200
Received: by iwn2 with SMTP id 2so8607572iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Oct 2010 11:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=vg2eD39HqZG06xVDOO4RPNYkC4Al5mg2jlysxqXakU0=;
	b=VHkZ7uFZkuWhsdvUaxtFZZiwE5qRR9Vjxopf2Q5xCOP1+zOrHueVjAIma2m/rUaLI/
	e08BST5d8veI6t/7x6vJSIoqER1tLFj0/WgvJxbpwhqS2rR1itdWIip94jaAtDORW/Y4
	3ui06qHl+9teVaOP/ByjONNCJCLzEWWwM9nwM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=WhSlxrOJnytn3Aq07BE87Ojm0TdMdQEGLd/hGAyE1fQOSFN7a1ls1J/KRJUyO1POwV
	gky3Hgup8yV9J0zzu6c4Ly+KB77uEpc1blJSE6MLG9QfiyJZ2ama0aOJrryoYwtK0/91
	OLcmCxUGwlbWMAQhQMN6fEhI2ckJQR1tPcCDk=
Received: by 10.231.157.212 with SMTP id c20mr12502687ibx.186.1286303764761;
	Tue, 05 Oct 2010 11:36:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Tue, 5 Oct 2010 11:35:43 -0700 (PDT)
In-Reply-To: <4CAADEDD.6070008@freyther.de>
References: <1286264643-6352-1-git-send-email-raj.khem@gmail.com>
	<1286264643-6352-2-git-send-email-raj.khem@gmail.com>
	<4CAADEDD.6070008@freyther.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Oct 2010 11:35:43 -0700
Message-ID: <AANLkTikGVoaKzOvW_+fpBRdaeGYZpyVU8yQ02JYOuD94@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/6] libtool-2.4: Add recipes for libtool 2.4
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
X-List-Received-Date: Tue, 05 Oct 2010 18:36:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 5, 2010 at 1:16 AM, Holger Freyther <holger+oe@freyther.de> wro=
te:
> On 10/05/2010 03:43 PM, Khem Raj wrote:
>
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eval libdir=3D`${SED}=
 -n -e 's/^libdir=3D\(.*\)$/\1/p' $deplib`
>> diff --git a/recipes/libtool/libtool-2.4/prefix-manpage-fix.patch b/reci=
pes/libtool/libtool-2.4/prefix-manpage-fix.patch
>> new file mode 100644
>> index 0000000..4728669
>> --- /dev/null
>> +++ b/recipes/libtool/libtool-2.4/prefix-manpage-fix.patch
>> @@ -0,0 +1,19 @@
>> +For cross environment, it not possible to run the generated executable.
>> +nstead use the build version of libtool to generate the man pages.
>
>
> instead instead of nstead (saw this in poky too). from what I have seen, =
poky
> does not apply this patch to 2.2.10...
>

yes I merged the poky changes but you are right. I think we dont need
this patch. I will do pruning once I have heavy lifting done.

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


