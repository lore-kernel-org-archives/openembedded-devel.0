Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Th2SZ-00066F-8I
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Dec 2012 19:15:39 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so564609pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Dec 2012 10:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=N/FQqAnYxfCoz8IvppRKtFZYm60n+VAsvPPJrDGZeMo=;
	b=Hfe8V3jy/Hd3uCE6anR8871Di2rD1Lgavcbk1DnEQn3V5QNizeVUBESbUlkYLUNOLO
	K4WA02MnyxXuhBUyXJmDBWHTyA+H63enc+HwE+cksi/mhIV65n80+kzNj49g6bt9KgwE
	meA1EoJlj9MfxDzqcZGkUrcfugY29KiBG5EBhZRR3zFCJ5tO47G89a7UXSmfKch5k/8t
	uZ5SiludpDR2Bl1PVoB8grkAQSbJljVE4gAFzIJodYbay1IbTD1bhVjpqPRWsX+okZCp
	TtTdNXH2j7odLAqBuCY/KLURLzd1g1kgRa1c3rgJv27239TbRc+SS+TgR9a1PFUqiRdH
	5caw==
MIME-Version: 1.0
Received: by 10.68.234.98 with SMTP id ud2mr17751699pbc.136.1354903271447;
	Fri, 07 Dec 2012 10:01:11 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Fri, 7 Dec 2012 10:01:11 -0800 (PST)
Date: Fri, 7 Dec 2012 16:01:11 -0200
X-Google-Sender-Auth: W1PmUWhf4yKR6l6p5rMS3OJy43Q
Message-ID: <CAP9ODKqQGbR83_sXRzs=ATNLvZu9JF=HHPQcvM0j37cYV=jExw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: udev (master and danny)
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
X-List-Received-Date: Fri, 07 Dec 2012 18:15:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I've been wondeing for udev for some time and today I sat down and thought
more about the current problems I see and how we could address the problems
I see.

For master:

 * OE-Core has 182 version of udev;
 * meta-oe has 173, 175 and 182 versions of udev;

Everything works but we have udev recipes at master of meta-oe unused. I
plan to send a patch to remove udev (173, 175 and 182) from master.

Regarding danny the context is a bit different:

 * OE-Core has 164 version of udev;
 * meta-oe has 173, 175 and 182 version of udev;

The only version which has init script is the 173 thus by default every
user of meta-oe needs to set preferred version to it or system will fail to
boot.

My proposal is to send a patch to update 182 recipe of meta-oe, in danny,
for the code used in OE-Core (so a tested code which works fine) and remove
all others (173 and 175) so meta-oe will be usable by default in danny
branch by users.

What people think about those things?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

