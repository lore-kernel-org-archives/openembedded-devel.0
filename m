Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PXGnU-0007j7-A6
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Dec 2010 18:23:51 +0100
Received: by pvd12 with SMTP id 12so1729072pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Dec 2010 09:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=bPHRr5LH9XMjOBUGhyRHypBEKFboRnwRry/ZOdwKByc=;
	b=Fbow9J2jCFXDbaA+oD34W8zA91+w1CZiAAe0hjrwhQbL7IB6HNx6tau+gi5WFXiu32
	WIg9YDXWNHKdZo4V28tTM+YkAhtVgoEmnlnQITJpDbhyjeGSBINAZ3IsFPvlXFFbWNfh
	cmYx6umv8K9+6tDAJO7uQZ546Cyx6AWh58ycE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=Oj6jCLtt2KsQf++F7KbIoQ+ToRb4q3Vq4fDED4/dRq0pDtnBKo5RzknZmfP0LHpe/V
	ncyAVmP1eRGqKtqtYP9LnF5HJdURhc6iJpOGfSTf3/KeYfFOHngX+3Bq0FurjQm4/UVf
	kC9oW4dV+12mpfQlaqaTQ7GNfEwY8D2+Cx3+I=
Received: by 10.142.134.4 with SMTP id h4mr10170808wfd.4.1293470092458;
	Mon, 27 Dec 2010 09:14:52 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id b11sm17952734wff.21.2010.12.27.09.14.50
	(version=SSLv3 cipher=RC4-MD5); Mon, 27 Dec 2010 09:14:51 -0800 (PST)
Message-ID: <4D18C988.5030701@gmail.com>
Date: Mon, 27 Dec 2010 09:14:48 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1PXBjV-00008M-00.nyrl-mail-ru@f68.mail.ru>
In-Reply-To: <E1PXBjV-00008M-00.nyrl-mail-ru@f68.mail.ru>
Subject: Re: qmake_base.bbclass patch to lookup for *.pro within ${S} instead of ${B}
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
X-List-Received-Date: Mon, 27 Dec 2010 17:23:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/27/2010 3:59 AM, Denis Dydychkin wrote:
>
> qmake_base.bbclass from release-2010.12 has ability to lookup for QMAKE_PROFILES if none specified by recipe. Unfortunately it does that in ${B} directory instead of ${S}, thus it does not work if they differ.
>

seems ok to me.Wait for qmake expert to comment.

> Here is suggested patch:
>
>
> --- a/classes/qmake_base.bbclass
> +++ b/classes/qmake_base.bbclass
> @@ -61,7 +61,7 @@ qmake_base_do_configure() {
>   	oenote "using qmake spec in ${QMAKESPEC}, using profiles '${QMAKE_PROFILES}'"
>
>   	if [ -z "${QMAKE_PROFILES}" ]; then
> -		PROFILES="`ls *.pro`"
> +		PROFILES="`ls ${S}/*.pro`"
>   	else
>   		PROFILES="${QMAKE_PROFILES}"
>   	fi
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



