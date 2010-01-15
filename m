Received: from mail-px0-f179.google.com ([209.85.216.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NViL3-0002xc-4u
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 10:19:32 +0100
Received: by pxi9 with SMTP id 9so377386pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2010 01:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=mvu8gh4N/6o+/5jVXp67RVKA5QEuRwBgsbudfgPKY7Q=;
	b=Nadv8fNk6qcHIXyGyiipesuJmTGhnUhEYMUJiTXTbCBoJHvTL52G6OVzplZ+vcG1Qx
	u977XI06P1fhINvs8eNPia+Hg4/+A0OSnhC8CdM+HwLcYh0BvtsP8JC+eiLUkri+tcae
	9wpJQ+iI3qiuOitPwo6cxFZ6aNNS1VZTlcsfc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=qKB2pqat9+dCkBA92v1uY9OIYSmTk/4IWw57+DC8G7Dnz3lOXpKM09lBNqsIag8TPx
	Cs4hJ+WRa8UqmscMm42tUEN1ZmaMEeHSV/ri5A0BiW7EazPRoMOMASlA/ZRdbWHf289X
	tOKS59LfLZXO1hauXUB3vm9x1756ule3MlTpM=
Received: by 10.140.180.20 with SMTP id c20mr1527924rvf.133.1263547036512;
	Fri, 15 Jan 2010 01:17:16 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.101.24])
	by mx.google.com with ESMTPS id 22sm1274549pzk.2.2010.01.15.01.17.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 15 Jan 2010 01:17:15 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <> <1263455739-13595-1-git-send-email-camelguo@gmail.com>
	<201001141014.53764.marcin@juszkiewicz.com.pl>
	<op.u6imubdtmn1qzu@guohr-laptop-ubuntu>
	<20100114195301.GA3529@gmail.com>
	<op.u6jv0uycmn1qzu@guohr-laptop-ubuntu> <4B4FE54D.3070402@mwester.net>
Date: Fri, 15 Jan 2010 17:17:05 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6kherjdmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <4B4FE54D.3070402@mwester.net>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.216.179
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Support building all project in one directory
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
X-List-Received-Date: Fri, 15 Jan 2010 09:19:32 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

=E5=9C=A8 Fri, 15 Jan 2010 11:47:25 +0800=EF=BC=8CMike Westerhof <mike@m=
wester.net> =E5=86=99=E9=81=93:

> But most -- in fact all except perhaps yourself and a few of the OE co=
re
> team don't build with different LIBCs in the same TMPDIR.  So all that=

> your patch does for the overwhelming number of users of OE is add
> additional directory levels to an already complicated directory
> structure, and provides them with absolutely no benefit whatsoever.

Yes, I guest there are some developers who have to build OE in one  =

directory. Look at below:

distro/include/angstrom.inc:CACHE =3D "${TMPDIR}/cache/${LIBC}/${MACHINE=
}"
distro/include/kaeilos.inc:CACHE =3D "${TMPDIR}/cache/${LIBC}/${MACHINE}=
"
distro/micro.conf:CACHE ?=3D "${TMPDIR}/cache/${LIBC}/${MACHINE}"
distro/minimal.conf:CACHE ?=3D "${TMPDIR}/cache/${LIBC}/${MACHINE}"
distro/shr.conf:CACHE ?=3D "${TMPDIR}/cache/${LIBC}/${MACHINE}"


distro/include/angstrom.inc:DEPLOY_DIR =3D "${TMPDIR}/deploy/${LIBC}"
distro/include/kaeilos.inc:DEPLOY_DIR =3D "${TMPDIR}/deploy/${LIBC}"
distro/micro.conf:DEPLOY_DIR ?=3D "${TMPDIR}/deploy/${LIBC}"
distro/minimal.conf:DEPLOY_DIR ?=3D "${TMPDIR}/deploy/${LIBC}"
distro/shr.conf:DEPLOY_DIR ?=3D "${TMPDIR}/deploy/${LIBC}"

 From above, I can guess that the developers or testers of the  =

distributions had met the same question as me. Without ${LIBS}, sometime=
s  =

it is difficult to determine which libc the runtime image is based on.  =

Image several weeks later how can you or other maintainers tell which li=
bc  =

it's based on? Different libc means different sysroot, but without the  =

changes in the patch, the whole building does not distinguish the sysroo=
t.  =

So I think adding ${LIBC} to build directory is necessary.

> At the very least, you really should provide a means to selectively
> enable this -- although I still don't see why it makes sense to suppor=
t
> multiple LIBCs in the same TMPDIR.

I wanted to implement it just as the singlemachine.bbclass. But due to  =

some little bugs in other bbclass, it is impossible to implement the  =

function without any changes to other bbclass files. See the following  =
 =

files:

  classes/package_ipk.bbclass |    2 +-
  classes/packagedata.bbclass |    2 +-

-	pkgdata =3D bb.data.expand('${TMPDIR}/pkgdata/', d)
+	pkgdata =3D bb.data.expand('${PKGDATA_DIR}/../', d)

But, if the change is acceptable, I will try to implement it as a bbclas=
s  =

file with a little patch file.

Thanks a lot!

-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


