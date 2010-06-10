Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OMj6a-0005Ie-Hw
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jun 2010 16:51:44 +0200
Received: by iwn39 with SMTP id 39so15770iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jun 2010 07:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=Yw03Atu3aZpVbIHws9q9Kf2jv9WCMFZhCmMtostMpyc=;
	b=IuJsbCx+hVwNsJBRtDulLMR7grQ/IRy9S5MpwBmZoOosbEedsvkkmUA1AqhEtY7BTk
	KUNshnYrWUe5mtAP7y0u3DvFrC/Lhsr7fLJc9XWtHRTHuTAh1zAK6rSLZKYeIfl4rXpU
	EsEzJuOI02gL861qRcZiXXzWpeo7A/AaMybnA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Pv/P7F9QlwvMOFHnkt6ZDADe+ZPE62N5Z7HGKiNKlrwbQ+Oz75BotkPzrT8drDqRdv
	mqy6Dj4mgDF4oVA50P7WHncTwff7zpFOP+Ee8pzs5d4X0WFhNGZ2t3SrdHnnzB/D1Obr
	Ne6aEq1+0zMmn8qsT+Fb4IuN861undG6PPojE=
Received: by 10.231.59.1 with SMTP id j1mr264374ibh.55.1276181226524; Thu, 10 
	Jun 2010 07:47:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.19.76 with HTTP; Thu, 10 Jun 2010 07:46:46 -0700 (PDT)
In-Reply-To: <76E258664B189C4CBEF125491CA11ECC9445E0CFA0@KCINPUNHJCMS01.kpit.com>
References: <76E258664B189C4CBEF125491CA11ECC9445E0CFA0@KCINPUNHJCMS01.kpit.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Jun 2010 07:46:46 -0700
Message-ID: <AANLkTim5vXwAR7HhAVZIfIOtalRlDK-GZg7f1IF-3JNi@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: python-native_2.6.4.bb do_unpack failed
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
X-List-Received-Date: Thu, 10 Jun 2010 14:51:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 9, 2010 at 10:57 PM, Soumya R <Soumya.R@kpitcummins.com> wrote:
> Hi All,
>
> =A0 =A0 I am using ubuntu 10.4 LTS and i am trying to build my own custom=
ized image
> for mipsel.. When i run bitbake avn-image i get the following error.
>
> cp: cannot stat `/home/likewise-open/KPIT/soumyar/openembedded/recipes/py=
thon/python-native-2.6.4/05-enable-ctypes-cross-build.patch': No such file =
or directory
> NOTE: Task failed:
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /home/likewise-open/KPIT/soumyar/openembedded/recipes/pyt=
hon/python-native_2.6.4.bb do_unpack failed
> ERROR: Task 749 (/home/likewise-open/KPIT/soumyar/openembedded/recipes/py=
thon/python-native_2.6.4.bb, do_unpack) failed
> NOTE: Waiting for 3 active tasks to finish
>
> =A0I am unable to tar Python-2.6.4.tar.bz2 by using the command
> tar -zxvf Python-2.6.4.tar.bz2
> gzip: stdin: not in gzip format
> tar: Child returned status 1
> tar: Exiting with failure status due to previous errors
>
> =A0 so i downgraded the gzip but still the same error.. If anybody got th=
e same error and resolved it please help me out.. I am stuck here:-(


https://bugs.launchpad.net/ubuntu/+source/gzip/+bug/524366

could be your problem

>
>
> Thanks in advance :-)
>
> Regards,
> Soumya
>
>
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


