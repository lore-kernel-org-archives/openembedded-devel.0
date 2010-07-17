Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OaELl-0002I6-Au
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Jul 2010 22:51:14 +0200
Received: by gxk3 with SMTP id 3so1474168gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jul 2010 13:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=m/cMSDv/XfCKe12im3Qd+E4k8JZWtlsXzUzAeVVhSEc=;
	b=CplOw9IqeBzlojVkCD6sydg9rGKyo7tnd4VoO3G7fHm/pGrAp4iS469+u2kFUDyBtU
	CtsrvyyzCFqJ0BWE8JvfZ+4iqpfiWev3MjaCneeJh7PFmIBShwWjOXK5FDz5rMxVxUxf
	iu2Hh1mc765oM1+RJ7LaNWJOGAv8H6SpD3nWM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=LoYepC9uVs820Trh95KoAi+CYdxNRcZppdgOKSFl/5LCh2zNfnKl5cxVcrFuXE9/O4
	1Da7vEFYxGYyAeBlAPWVYRDvIeMNi5xgjf8Ix9Pst6vh/fDOEAHg/S7fEETsbVTgjd53
	tcJfQFd7p/SpZnMMcyVXWglNHVLV0KuM7mCNY=
MIME-Version: 1.0
Received: by 10.100.141.3 with SMTP id o3mr2849664and.229.1279399861919; Sat, 
	17 Jul 2010 13:51:01 -0700 (PDT)
Received: by 10.100.127.11 with HTTP; Sat, 17 Jul 2010 13:51:01 -0700 (PDT)
In-Reply-To: <4C417DA8.8050101@freyther.de>
References: <AANLkTimwFjLODTbT6WEEhthhjwYMiMQ4nt5RtXniNgZb@mail.gmail.com>
	<4C417DA8.8050101@freyther.de>
Date: Sat, 17 Jul 2010 13:51:01 -0700
Message-ID: <AANLkTilEVlCDZYYMFrjKI0xL2Yq-uOL1YED9CR5I2e5s@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: spca5xx does not build
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
X-List-Received-Date: Sat, 17 Jul 2010 20:51:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I just tried adding EXTRA_CFLAGS in the bb file and still errors in
the same way. I also cleaned it to make sure before building.

Also there is an error stating an implasibly old time stamp from 1964?



On Sat, Jul 17, 2010 at 2:53 AM, Holger Freyther <holger+oe@freyther.de> wr=
ote:
>
>> | make[1]: Entering directory
>> `/home/vdubhack/overo-oe/tmp/sysroots/overo-angstrom-linux-gnueabi/kerne=
l'
>> | scripts/Makefile.build:49: *** CFLAGS was changed in
>> "/home/vdubhack/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/spca5xx-2=
0060501-r81/spca5xx-20060501/Makefile".
>> Fix it to use EXTRA_CFLAGS. =A0Stop.
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


