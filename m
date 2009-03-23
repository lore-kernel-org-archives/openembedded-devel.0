Received: from [74.125.44.154] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LloXU-0000oX-CB
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Mar 2009 19:06:20 +0100
Received: by yx-out-1718.google.com with SMTP id 3so1495010yxi.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Mar 2009 11:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Ca+eHl+9pBIqsQYSWAsmS50bUXIMDP2DwxEoSpK2Jsw=;
	b=RZlJPdTQy2Hg1syBkKfZ1Dhdhy2UueByT7MJjJr52GCaHcFIdU9aA5Wxq3E0FevclN
	6I5dDWbYwKwZ+6T4o+7eGcyIA1BlTuaKaPZ+x4ywWDZkklguGz7I2fQAtcnH3r69PGNo
	nncwpUFnIomG4yQ9+JoocpzT8vHtLnq/i/ZAQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=HNpgyfflByaMcRaTyYgK8p/ook111exaCuBnRS8asQ49jLPOl7stPYvGDxAJcMdGr5
	VxefddrmH1S5IlU/GZV/z0VAjXMnmOaU6R8wErPkvTipglI1j6nCx1NaRKijpYcCWgJe
	nna8lZZjSQ19q1hNc8ZEi3zjEUNyQUs8jYnKM=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.131.16 with SMTP id e16mr6486775and.118.1237831496631; 
	Mon, 23 Mar 2009 11:04:56 -0700 (PDT)
In-Reply-To: <20090323162121.GA23484@denix.org>
References: <1237246365-32076-1-git-send-email-denis@denix.org>
	<1237246365-32076-4-git-send-email-denis@denix.org>
	<87y6uw4nwo.fsf@neumann.lab.ossystems.com.br>
	<20090323162121.GA23484@denix.org>
Date: Mon, 23 Mar 2009 15:04:56 -0300
X-Google-Sender-Auth: e42fe1a32f8c1688
Message-ID: <be7a9f3d0903231104u632d2961w7e84e21a1f9bbd1f@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 3/3] base.bbclass: fix base_get_scmbasepath() to look for recipes/ and fall back to packages/ while parsing BBFILES
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
X-List-Received-Date: Mon, 23 Mar 2009 18:06:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Mon, Mar 23, 2009 at 1:21 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Mon, Mar 23, 2009 at 05:57:27AM -0300, Otavio Salvador wrote:
>> Denys Dmytriyenko <denis@denix.org> writes:
>> In my opinion, while it makes life easier the result of it is mixed
>> environments.
>>
>> I'm still using packages/ in our local distro and I haven't yet found
>> the time to merge current tree since we've a lot of local recipes that
>> will break and this change could make it simple but I still refrain
>> about having it included.
>>
>> It looks like the logical thing is kind of "force" people to handle it.
>
> First you said you are not ready to make the switch, and then you are saying
> we need to force people into it... :)

Well me not being ready to make the switch is due our deadlines. This doesn't
change my general idea about forcing people to handle it and avoid those
"backward compatibility hacks" to stay forever ;-)

> Anyway, it doesn't matter anymore, as this code has been replaced completely
> by one of kergoth's recent commits.

Oh! I didn't see it. Please archive it in PatchWork then :-D

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


