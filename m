Received: from [74.125.44.153] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M03Ck-0003V9-An
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 May 2009 02:35:46 +0200
Received: by yx-out-1718.google.com with SMTP id 36so1683892yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 May 2009 17:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to
	:subject:organization:user-agent:x-url:x-attribution:date:message-id
	:mime-version:content-type;
	bh=lsqkxI9zRLYXUhG2ltLNIMjkO/JNY8x1kCM9vVYZdAI=;
	b=dw5asL47wwxu7snQsMNs7U8i1LAhpIJx85iSOkCKVDzE7IOdIS8kG7uao5LVdj84es
	hYE1hsdnUsEf5MuwbfK5iwXYb4l3fC/9O0snJM+MNLE1I8CO23cWeTuJJrbh//8hUDX9
	s1NGs+wJUpvjueIiJ5ok021/m15pMHhmDMV8E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:organization:user-agent:x-url:x-attribution
	:date:message-id:mime-version:content-type;
	b=qzva0KSQr41j3y7lBTaNFSESQ8IqbVrIl7e4qxv93Nqei1H9cRcgktaW9QMEqUpj0L
	ELF8/WjUZOS1zCvhigMuWZQ6scQWFPg+q4KIBpr0nAcR1RLqpzrkJwadodeqstGyHkBg
	sklVCJ/fCq161l5pjRyDiUYf16ZJeh1CROeIY=
Received: by 10.100.126.15 with SMTP id y15mr7202391anc.71.1241224215036;
	Fri, 01 May 2009 17:30:15 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 6sm9710347ywc.51.2009.05.01.17.30.14
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 01 May 2009 17:30:14 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 3CEA5C4C7A4; Fri,  1 May 2009 21:30:11 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Development Mailing List
	<openembedded-devel@lists.openembedded.org>
Organization: O.S. Systems Ltda.
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.92 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Fri, 01 May 2009 21:30:10 -0300
Message-ID: <8763gkl52l.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Subject: Recurrent failures to unpack packages
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
X-List-Received-Date: Sat, 02 May 2009 00:35:46 -0000
Content-Type: text/plain; charset=us-ascii

Hello,

I've been seeing this kind of failure at stable and would like to know
if someone has any idea where this come from?

gzip: stdout: Broken pipe
tar: Child returned status 1
tar: Exiting with failure status due to previous errors

In one of our images, we had four failures of this kind. But I'm unsure
where it comes.

bzip2: I/O or other error, bailing out.  Possible reason follows.
bzip2: Broken pipe
        Input file = /home/otavio/hacking/ossystems/sources/kbproto-1.0.3.tar.bz2, output file = (stdout)

bzip2: I/O or other error, bailing out.  Possible reason follows.
bzip2: Broken pipe
        Input file = /home/otavio/hacking/ossystems/sources/videoproto-2.2.2.tar.bz2, output file = (stdout)

bzip2: I/O or other error, bailing out.  Possible reason follows.
bzip2: Broken pipe
        Input file = /home/otavio/hacking/ossystems/sources/libXt-1.0.5.tar.bz2, output file = (stdout)

But same packages built fine with a -c rebuild.

Any guess?

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


