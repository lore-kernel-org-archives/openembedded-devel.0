Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NuL7T-0001jv-JY
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Mar 2010 08:35:17 +0100
Received: by gwaa20 with SMTP id a20so902367gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Mar 2010 00:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=p50p2LgdXgVKjAaKXAqfgjGySv9lDxLlbl9NMf33B0Y=;
	b=dZwWB/SYuSxnYBY+xT0ggfdS5dCh7IUB+/5IDzShI0oPM9m8vd0gnqcbjTkwmmwCmZ
	senuMBdYbD0cm3gqEZUF+047q1vsk22FRT2DiFLDSIOBAlrfiyt5dny/HjbFuHf3WzKv
	PdiyeMNoykZWHMUpopLK+5o4YXSqVbZ8yE/Xc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Iv18y5r5Q8ijAOeigsdL6oFQtKdkwxiBSE50sqXoLPq633+VnnEs5tXWXALYnJ6s/I
	hnRHf6WdKqK5L8U0J1TLJRUSixS+W4pj5yxN7YtDo5pNKvACmj88fU0tXmmwsulUEo2y
	11vW0c3fKKq9IKTyn6AV8yyJ1vfDX2WBJrQV8=
MIME-Version: 1.0
Received: by 10.101.186.32 with SMTP id n32mr6731173anp.7.1269415925702; Wed, 
	24 Mar 2010 00:32:05 -0700 (PDT)
In-Reply-To: <20100323183615.GE3249@xora-eee.xora.org.uk>
References: <201003231901.24017.marcin@juszkiewicz.com.pl>
	<20100323183615.GE3249@xora-eee.xora.org.uk>
Date: Wed, 24 Mar 2010 08:32:05 +0100
Message-ID: <ac9c93b11003240032h636a60detc59ab859e6fa79c8@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Removal of e2fsprogs-libs
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
X-List-Received-Date: Wed, 24 Mar 2010 07:35:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/3/23 Graeme Gregory <dp@xora.org.uk>:
> On Tue, Mar 23, 2010 at 07:01:23PM +0100, Marcin Juszkiewicz wrote:
>>
>> During last days I spent a bit of time on e2fsprogs* and util-linux-ng
>> recipes. They are cleaner now but there is still some work to do.
>>
>> We have many recipes which depends on 'e2fsprogs-libs' when they want
>> 'libblkid' or 'libuuid' which are provided by 'e2fsprogs-libs' and
>> 'util-linux-ng' recipes. I checked how Debian solves that and got into p=
oint
>> where there is no 'e2fsprogs-libs' recipes in my tree and everything is
>> building.
>>
>> What needs to be changed?
>>
>> 1. git rm -r recipes/e2fsprogs-libs
>> 2. check each recipe which depends on 'e2fsprogs-libs' which library it =
really
>> =A0 =A0wants
>> 3. change each recipe which wants 'libblkid' or 'libuuid' to depend on
>> =A0 =A0'util-linux-ng'
>> 4. change each recipe which wants 'libcom_err' or 'libss' to depend on
>> =A0 =A0'e2fsprogs'
>> 5. add "--with-elf-shlibs" to 'e2fsprogs' to get 'libcom_err' and 'libss=
'
>> 6. fix packaging of 'e2fsprogs' to get separate packages for libraries.
>>
>> I can work on that in next days but want to inform everyone that such ch=
ange
>> will be done.
>>
> Hrw thanks for cleaning this up, feel free to add my ack to your complete=
d
> worked.

Although I highly welcome the cleanup proposed by Marcin, I feel it is
not proper to submit an ack for patches that are not submitted as
such.
Acked-by indicates approval, and I find it somewhat fishy to approve a
patch that you haven't seen yet.
(without wanting to question the value or quality of Marcin's work, as
that will undoubtly be ok).

Frans


