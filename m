Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PZyNC-0005XD-6D
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Jan 2011 05:19:50 +0100
Received: by bwz10 with SMTP id 10so13674879bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jan 2011 20:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=QTcgsT4rhRREYkfqzwHBPVmivhtGr2RpbfaXxL36mb4=;
	b=Xx2mB6rQ7INDeijB27pkmlExB8kOq7sKMRMzni6fAK63pVjSWeERUPVinxhDpuGqyG
	mgzYjHQw1/Zdpu0WV48fcl29t5veQ2bs6wfwTS+d65azZD52oZheXahkF+8rliqWF4yI
	oF/wkD4WYIJt11qDwRhJydGoSOOr8kja5yFnI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	b=ORdCJt6UZhEaYGmEOEf5ZlZVqpLRZzFLTJ5uJ/PtrIS/A0m4wyblMh596c3ilLlJlp
	1WfvR8ZfcwdJUcAxEr3LvogueFl2Pot+9+xwI2rCFkphM9zhhg5Bvo8mVs1IEUi5BM4g
	vKW0e+A2C9JN+Sw+IdCWrk0YYG8J3xRahioxU=
MIME-Version: 1.0
Received: by 10.204.102.206 with SMTP id h14mr16324872bko.45.1294114768454;
	Mon, 03 Jan 2011 20:19:28 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.59.147 with HTTP; Mon, 3 Jan 2011 20:19:28 -0800 (PST)
Date: Tue, 4 Jan 2011 02:19:28 -0200
X-Google-Sender-Auth: IJz9hmImMDbNbtDI9Z_MSK1coGo
Message-ID: <AANLkTika6fWNbfEdp-202+6QK+cTtsFAD8k+fTtc-396@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Problem handling PR in .bbappend files
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
X-List-Received-Date: Tue, 04 Jan 2011 04:19:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

I am using .bbappend file to change the linux kernel recipe, as follows:

--8<--
otavio@neumann:~/hacking/ossystems/oe$ less
ossystems/recipes/linux/linux_2.6.36.bbappend
# change revision in a dynamic way
PR :=3D "${PR}.oss.1"

# look for files in the layer first
FILESPATHBASE_LAYER :=3D ${@os.path.dirname(bb.data.getVar('FILE', d, True)=
)}
FILESPATHBASE =3D. "${FILESPATHBASE_LAYER}:"
--8<--

It works however when I build the image the kernel is *always* rebuild.

Any guess?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


