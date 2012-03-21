Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SAMwQ-0001Gk-SI
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Mar 2012 15:55:11 +0100
Received: by dado14 with SMTP id o14so1622301dad.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2012 07:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=jDJxFCtCmc9RIy8f8Qpy2GcL73rQD2fqnxiyTKaGilk=;
	b=Pxpdudqjy+737BzjyEc4TOPWtsL2tOxSyW2yEBnsy3DFMnG/vwqhuCFIOXiLbEnCrW
	+2KHvx+DnLSbAQFBnu3Z1FKLvfICMrNi/NNcAOF4N52bWcq3q2UVGvq94PSzn+FEfvCb
	OJLoZjz74ofR8lNRi03h1iNUWA94CYa234EVe0+c1FhvTVxRRh33RCb88LVLpqqJMDo1
	H8VmaJE0M8QpplRQCEQUpc1AY9ia2KGXz4e5XHnrLYRdGrMpGXdG4tzFbUpkie8JXnUL
	EdAdG9gldADqXMr0pJqP/9dchbBMDHQ0+Js0NH/IIsU326qubRsmAgFSEMh+Zvuit1XO
	I4jQ==
MIME-Version: 1.0
Received: by 10.68.217.97 with SMTP id ox1mr11849154pbc.81.1332341175919; Wed,
	21 Mar 2012 07:46:15 -0700 (PDT)
Received: by 10.142.241.4 with HTTP; Wed, 21 Mar 2012 07:46:15 -0700 (PDT)
In-Reply-To: <CA+M6bXnXmFf0syVz-71Y_Ovkq1pvsw8DBjZcfx1=dvZ4pD48wg@mail.gmail.com>
References: <4F69AF4A.8050809@dresearch-fe.de>
	<1332326252-7381-1-git-send-email-sledz@dresearch-fe.de>
	<CA+M6bXnXmFf0syVz-71Y_Ovkq1pvsw8DBjZcfx1=dvZ4pD48wg@mail.gmail.com>
Date: Wed, 21 Mar 2012 07:46:15 -0700
Message-ID: <CA+M6bXmJ9YWR74eEWj-0pNYVziCNb+8Ac-DKPNG1inPaELKAiA@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] libmatthew-0.7.1: SRC_URI updated
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
X-List-Received-Date: Wed, 21 Mar 2012 14:55:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Mar 21, 2012 at 7:44 AM, Tom Rini <tom.rini@gmail.com> wrote:
> On Wed, Mar 21, 2012 at 3:37 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
>> libmatthew-java-0.7.1.tar.gz is no longer available at the original
>> location.
>>
>> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
>
> NAK, please switch it to the snapshot.debian.org URL I provided so we
> don't have to change this recipe at some point in the future again.

On third thought, lemme think about this.  I don't like pointing
somewhere that might remove it, again, but I also don't like changing
checksums for folks that already have it down.  So, unless someone
else disagrees, we'll favor same checksums over retention and if
fedoraproject removes it, we'll just point at the copy on the OE
server.

-- 
Tom


