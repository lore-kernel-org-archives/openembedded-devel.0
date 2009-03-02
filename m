Received: from [209.85.134.187] (helo=mu-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LeAnU-0002tf-Bp
	for openembedded-devel@openembedded.org; Mon, 02 Mar 2009 17:15:21 +0100
Received: by mu-out-0910.google.com with SMTP id i2so791493mue.0
	for <openembedded-devel@openembedded.org>;
	Mon, 02 Mar 2009 08:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type;
	bh=ttOr7zbOrbEeTLE0DTAUGGc8TtuekphajR8iiKVjT6s=;
	b=jy60o8x8akllsL7f839Z1XWmLgFzFLjAL4ej6ulkrHispOeDRPN5UAPqsmdL6tCY4z
	/Avhxx2l1nCzw2l++k8zEL7hv+IiJlGGk7GWcjif9wvgMA2+LO2Z3b68pGOsIMVWCgOS
	6t0B+jluVZdL9jRh44Y80cdKumUVlOwFyZXic=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type;
	b=MP1Q742h4nAur9MjEdBUmpD/usS9vy1JYwI9ZpzT7hrkZf+s7ssmWpZuwOFk3BQMUH
	Z7wK9Ucwv+5N7TDemmWP5eBLCkWwrYzkw9AxXGdNZIw2OjqEw9f4VzNqNHqnyyHULkDt
	o/xONvhiwnkVGNG9Aww/54kiaGD5POJtvVb0I=
Received: by 10.103.182.3 with SMTP id j3mr3007515mup.107.1236010281724;
	Mon, 02 Mar 2009 08:11:21 -0800 (PST)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 23sm20208mun.0.2009.03.02.08.11.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 02 Mar 2009 08:11:20 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 3ACEA6100DD; Mon,  2 Mar 2009 13:11:10 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: <openembedded-devel@openembedded.org>
Organization: O.S. Systems Ltda.
References: <499DB474.1070205@zone42.org>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF68E@hiob.intern.dresearch.de>
	<be7a9f3d0902200317x93d8888wd3e9ce41f0641d4c@mail.gmail.com>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF695@hiob.intern.dresearch.de>
	<871vts4z4x.fsf@neumann.lab.ossystems.com.br>
	<49A01664.7090908@dresearch.de>
	<8763j1q3di.fsf@neumann.lab.ossystems.com.br>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF697@hiob.intern.dresearch.de>
	<be7a9f3d0902261002p4d663dd6p28bbf37cf5962dba@mail.gmail.com>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF6C4@hiob.intern.dresearch.de>
	<be7a9f3d0903010830u4d07af83i8e51bd075f945d75@mail.gmail.com>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF6D5@hiob.intern.dresearch.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.90 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Mon, 02 Mar 2009 13:11:10 -0300
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF6D5@hiob.intern.dresearch.de>
	(Steffen Sledz's message of "Mon, 2 Mar 2009 08:10:04 +0100")
Message-ID: <87y6vnc3c1.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Subject: Re: OE - help with libtool problem
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
X-List-Received-Date: Mon, 02 Mar 2009 16:15:27 -0000
Content-Type: text/plain; charset=us-ascii

"Sledz, Steffen" <sledz@DResearch.DE> writes:


[...]

>> It is rather strange that it behaves as it does since even updating
>> the libtool it still fails. Since I'm not experienced at subversion
>> and have no idea how to fix it I belive you'd need to ask someone else
>> for help on that.
>
> I've CC'ed this to the mailing list in the hope there is someone able to help.

It is rather confusing .. I dig into the autotools code and failed to
see where it fails to include the libtool m4 macros. I identified it has
a libtool.m4 file at build dir and tried to replace it with newer
version but it didn't work.

It would be quite nice if someone could take a look at it and solve this
properly.

Cheers,

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


