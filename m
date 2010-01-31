Received: from mail-px0-f179.google.com ([209.85.216.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NbU6V-0006i0-Mg
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Jan 2010 08:20:22 +0100
Received: by pxi9 with SMTP id 9so2994120pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2010 23:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=Aqb22HOsuudS5EQBqjnlBAH9+KJAhn9sM49Nx30qWc8=;
	b=beCVTuzvrtnhW1TiDRyVM7KXnXFMt4a5g/fZb5KccPn3K08hyDKxXxt6ZAa2zTgrcH
	pRXnqRV2JI0HwYBSVIvaiaU99YmvDWSxnMP5MOGVrybEXs1RhuQj0Z4lL59W4vUVPhKJ
	JbDjrsVwqUBh9ONWanwYaN2eDIHbLRC0Kf8zQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=qYBjZUo9I+qc3q5vzr687ijWgFehmnq85NoRDR8kbMX0cQYXxI3lAKAO95uWPdQHr3
	gwMiOzpCfCG5iwFS6WkCqp33z7UzQZFSNVqKMQ5kY/X22ouuqRqPLtVPuTUjbhDXPW7c
	O76zhEqgkZRscb1KkzG8GdHxBlpAz5tCAEQhM=
Received: by 10.142.8.34 with SMTP id 34mr2010562wfh.190.1264922273934;
	Sat, 30 Jan 2010 23:17:53 -0800 (PST)
Received: from camelguo ([123.54.107.86])
	by mx.google.com with ESMTPS id 21sm3310737pzk.15.2010.01.30.23.17.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 30 Jan 2010 23:17:53 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u7dv44vqmn1qzu@camelguo>
	<201001310812.55227.holger+oe@freyther.de>
Date: Sun, 31 Jan 2010 15:17:45 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u7dyjvnhmn1qzu@camelguo>
In-Reply-To: <201001310812.55227.holger+oe@freyther.de>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.216.179
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: circular dependency when building linux_2.6.25.bb
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
X-List-Received-Date: Sun, 31 Jan 2010 07:20:23 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

=E5=9C=A8 Sun, 31 Jan 2010 15:12:55 +0800=EF=BC=8CHolger Hans Peter Frey=
ther  =

<holger+oe@freyther.de> =E5=86=99=E9=81=93:

> It is very nice that you try to so many configurations. Is this the sa=
me
> circular dependency you have hit earlier with the kernel recipes?

Yes, I did found some kernel recipe has circular dependency. Previously,=
 I  =

submit a patch for storcenter kernel, which has circular dependency too.=


-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


