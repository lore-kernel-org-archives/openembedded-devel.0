Received: from [209.85.221.124] (helo=mail-qy0-f124.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LlfqD-0007Lu-L9
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Mar 2009 09:49:05 +0100
Received: by qyk30 with SMTP id 30so2345806qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Mar 2009 01:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to
	:subject:organization:user-agent:x-url:x-attribution:date:message-id
	:mime-version:content-type;
	bh=9gUuPUKNehZvXxa28l8FBr9LoWrEgkG3NFqPjp43kwA=;
	b=PwndPVyIW68y1qM0Lc7+eoFtArSLGoxVlq0gbzFYKgI4rjUhI3a1nJiqAqH8Br6Pg0
	CTUSq7AABCQ+9ZsXPRsslVRtrHoPIoUhcBH1KIwHP3YFDsWSa/i3ZIRcYf2HqbRRbGnz
	nS+LZ8cAcJnxcsc0HzSK67ntcnBT9WvMQGD5s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:organization:user-agent:x-url:x-attribution
	:date:message-id:mime-version:content-type;
	b=Yd1k913Flhv/81c/NMkfj08P5V8mNATVP2ssxnuzrVdJuG8OKXAuH0TzofKFxrH8+w
	oYSSh4TJL9QhwBjnPKo/zmq3TNfqQEzd8Uw6FdUPrhdO2h4Zb3o4TYXjzfosNhJcMX2B
	IQCDC4QeHTlJZYNIvQKNBi4c8kdvo9YcVL7Eo=
Received: by 10.224.19.202 with SMTP id c10mr8496495qab.30.1237798061900;
	Mon, 23 Mar 2009 01:47:41 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 9sm9028310ywf.6.2009.03.23.01.47.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 23 Mar 2009 01:47:41 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 29C3D6100F0; Mon, 23 Mar 2009 05:47:37 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Development Mailing List
	<openembedded-devel@lists.openembedded.org>
Organization: O.S. Systems Ltda.
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.91 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Mon, 23 Mar 2009 05:47:36 -0300
Message-ID: <873ad462xj.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Subject: Problems with current workflow using PatchWork
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
X-List-Received-Date: Mon, 23 Mar 2009 08:49:05 -0000
Content-Type: text/plain; charset=us-ascii

Hello,

Today I went to take a look if there were anything I could help with at
OE side and went to PatchWork to review pending patches and noticed a
cuple of issues.

 - we need to do more review cycles at PatchWork and update the status
   according

   There're applied patches that were not archived and patches that we
   asked for changes that hadn't the status changed to reflect it. This
   way PW loses the main feature that is trackability of patch status.

   Please commiters, when doing a commit please remember to archive the
   patch at PW.

 - merges need to be archived on PW

   I noticed tha the RPM fixes went finally merged into the
   mainline. GREAT! But they were still listed as waiting for
   review. Since Marcin has commit, he did the merge but forgot to
   archive the whole set of patches at PW.

   I suggest we when commiting our own patches take care of archiving
   them at PW to make life easier to everyone.

What others think?

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


