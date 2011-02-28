Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Pu7Pb-0006mu-7p
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 19:01:35 +0100
Received: by bwz10 with SMTP id 10so3888336bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Feb 2011 10:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=ulkNzLiCZlvzmgC488g66DApxg60BEMyPem9Oc8L8BI=;
	b=uvOeL/LSWMmTLRsgn9+JaUoFRnvtd3MozhwGMFgQ3H7937EQbDZmAmY7YFwUGS/jno
	EJhlBp62c1gyXADWGQUig6aqOlSeRklmxI/1abllpUJuUALXYrDHM+5ssVtcX+TldsqL
	eE7sEM0XwvoY9sQp1a1PM8tjQ01G+VFldhW5g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=q5GCEoMqZafuM7SFuuhMVD/BDf3z+qM7YM0lEHwf86H08CbmaML3rb50q8RzPMAyZd
	4dQpz3XtCPrkEFb/llBA53lOzyd0fqLLBfx/k+AbWq/kpZmTrYulz5eXhbwbVOfvoFQe
	vlfC6JVZerExWoWBWjrzAUh1BHABFf1gUHdNc=
MIME-Version: 1.0
Received: by 10.204.81.72 with SMTP id w8mr5104809bkk.205.1298916010267; Mon,
	28 Feb 2011 10:00:10 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Mon, 28 Feb 2011 10:00:10 -0800 (PST)
In-Reply-To: <1298915684.23547.28.camel@phil-desktop>
References: <1298899606-9139-1-git-send-email-otavio@ossystems.com.br>
	<1298899606-9139-2-git-send-email-otavio@ossystems.com.br>
	<1298912239.23547.10.camel@phil-desktop>
	<AANLkTi=fohQFaxQnTP-VxoNh+P8np9uXCsvChtdT2ORT@mail.gmail.com>
	<1298915684.23547.28.camel@phil-desktop>
Date: Mon, 28 Feb 2011 18:00:10 +0000
X-Google-Sender-Auth: GgiBcLtOEYRlaezSVbhjW-z42SQ
Message-ID: <AANLkTi=vTaLchhK8NRWwwUOFkvyTM5LyCzb1R-cWC=zG@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <philb@gnu.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] conf/bitbake.conf: add DISTRO_ARCH and MACHINE_DISTRO_ARCH
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
X-List-Received-Date: Mon, 28 Feb 2011 18:01:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2011 at 17:54, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2011-02-28 at 17:04 +0000, Otavio Salvador wrote:
>> We have a set of products that reuse a common distro definition but
>> has different needs on a small set of packages. To avoid having them
>> all rebuild we set those to DISTRO_ARCH and the ones that depends on
>> machine and distro to MACHINE_DISTRO_ARCH avoiding a lot of rebuilding
>> and CPU time.
>
> That sounds to me like you're using ${DISTRO} for a purpose that was not
> really intended. =A0I do have some sympathy for the scenario you mention
> but I'm not convinced that adding these new ARCHS for everyone is the
> right answer.
>
> Obviously you're welcome to bash PACKAGE_ARCHS any way you want in your
> own DISTRO.conf file and I think that's probably the right place for
> this sort of thing rather than putting it in the global bitbake.conf and
> causing extra complexity for everyone. =A0Or maybe you could consider
> using ${MACHINE}, which is already a PACKAGE_ARCH, to discriminate
> between the different packages.

Adding it to my distro seems to solve my problem. The problem of using
MACHINE is that I need it to be rebuild if DISTRO changes, hence
MACHINE_DISTRO_ARCH.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


