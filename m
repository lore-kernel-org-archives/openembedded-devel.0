Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NSyMz-0005DP-23
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jan 2010 20:50:12 +0100
Received: by fxm4 with SMTP id 4so15559817fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jan 2010 11:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=CvF9GcNbVVtYWKJ/eYVKOF8/gIaiIJEH/zK/DeBY1UU=;
	b=vl+tfSzPgFHCB2Vw16MtDw1HtZKhncIWwQhiS+RWmkKqyp/Q695n1iLLtZHJn+VlWR
	vJEtz6wzk2vVAhIyE+Pox518AuduAaifFa4AD0wR9bRvSz5aCvsgglGrzQuQ4zQranAg
	nr+/BIkgUmccxbMWc14cZ/AhZOwnsMb9rmIjQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=GRnAjt+G441pqECSngcUlXOHL+dazhezcIkRDHqKJxeirCm29VA0aGSeCEEJIlxgkp
	zWJ0eB7wG4cQqp2kzn0KX/3Qqkusyg3RxkdaSBTCEwiWRaWyfYifNm/b3m11RTtEf94N
	lTa7uam8izz4vWXGwH97ugeZtK0WSWA8mC4dM=
MIME-Version: 1.0
Received: by 10.239.142.73 with SMTP id f9mr401493hba.107.1262893683743; Thu, 
	07 Jan 2010 11:48:03 -0800 (PST)
In-Reply-To: <1262892164.2553.230.camel@lenovo.internal.reciva.com>
References: <hi5b61$f7h$1@ger.gmane.org>
	<1262892164.2553.230.camel@lenovo.internal.reciva.com>
Date: Thu, 7 Jan 2010 20:48:03 +0100
Message-ID: <c384c5ea1001071148h770db2a7p10f6a7b51582fea5@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: RFC: Bump default version for gtk+ to 2.18.3
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
X-List-Received-Date: Thu, 07 Jan 2010 19:50:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Jan 7, 2010 at 8:22 PM, Phil Blundell <philb@gnu.org> wrote:
>
> All too often we end up with new versions being stuck in at
> DEFAULT_PREFERENCE -1 simply because the person updating the recipe
> didn't want to take the responsibility for testing it. =A0This is
>
What should that responsibility involve?

I usually "test" on one or two machines but still set a DEFAULT_PREFERENCE =
"-1".

It's very hard for the committer to collect enough testing evidence
for all the use cases / variables.

Maybe we should be less restrictive on bug fix releases (typically
x.y.z to x.y.z+small number).

Regards,
--=20
Leon


