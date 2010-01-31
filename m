Received: from mail-pz0-f177.google.com ([209.85.222.177])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NbSeL-0006C7-5L
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Jan 2010 06:47:12 +0100
Received: by pzk7 with SMTP id 7so3123518pzk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2010 21:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=xCchEb7T3KucK3BWO3UfVKm1AgQcnFEC9NGrgL0ZPdA=;
	b=v6ec2japjy2h8drcxPSwQopVsqhrNxhajuVgylxNfiULYIM273KOQMSfyDgfE4HPx1
	u/+M+IJIUwkjok7GJl0fR3Wo9erot05BihJkNom/s/z68OdeY6BdQDpWRqhIYyIUir9f
	MhyqvW1j/K8iYpdkpFetdlX3VbjtjitBTKsQA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=RB8PSlsywb0xwtenxoBo2Cg2H9JA8bDcZxL+b2K4J68mdiPLtb+UMnchAD+NYz1mba
	EyNRSSyB1nqI2PU0Bu57PVFelDXi/EQmMCXSjmpaNQNNKL+IW4d/GyZtgZMz5qHPlFKa
	G5aSFhq9BwkJve8P4JD2CaumJ3LQ8EG4LWekY=
Received: by 10.141.214.39 with SMTP id r39mr1967299rvq.278.1264916683324;
	Sat, 30 Jan 2010 21:44:43 -0800 (PST)
Received: from camelguo ([123.54.107.86])
	by mx.google.com with ESMTPS id 21sm3225705pzk.7.2010.01.30.21.44.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 30 Jan 2010 21:44:42 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u7dmmldamn1qzu@camelguo>
	<19c1b8a91001302122x5cde3628xd57639405a862736@mail.gmail.com>
Date: Sun, 31 Jan 2010 13:44:33 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u7dt8jyhmn1qzu@camelguo>
In-Reply-To: <19c1b8a91001302122x5cde3628xd57639405a862736@mail.gmail.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.222.177
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: building piccontrol - 0.4 failed due to lack of liblua5.1.a
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
X-List-Received-Date: Sun, 31 Jan 2010 05:47:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

=E5=9C=A8 Sun, 31 Jan 2010 13:22:16 +0800=EF=BC=8CKhem Raj <raj.khem@gma=
il.com> =E5=86=99=E9=81=93:

> in your build tree check where liblua5.1.a is installed and then
> go from there.

instead of liblue5.1.a, I found libua.a on my build tree. Maybe it is th=
e  =

cause of the error.

./armv5te-oe-linux-gnueabi/lib/liblua.a

-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


