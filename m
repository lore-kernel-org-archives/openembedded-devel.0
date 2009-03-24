Received: from [74.125.44.157] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Lm9WZ-0006Wc-A5
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Mar 2009 17:30:47 +0100
Received: by yx-out-1718.google.com with SMTP id 3so1805685yxi.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2009 09:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=vFabDWGss6AcFtHY8E18Rvtkc90+ZaGHpcNal/cXvOk=;
	b=lDmCH/ranIrqMst6DgyAAV0/UAdmJ1XAsMf+x2iphiSoFe1wNrZqb/lGbn1Hi1RIvy
	UqaGgPqnobA4hVMSZYZAORqdqZq2mhKTV4TkJ/gKrNz5fFeCGkgM7KaaavarzGAdfowm
	Uv3jzN80DgUyyvV3EMtecO3HiEqB7oRWhUHt0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type
	:content-transfer-encoding;
	b=O/rY0ri4PtdY+V830+wwaVo473j/O2ZwikqCSpiP5cLwqmDz2r4FxdRJIx3A/lCt/j
	BZHRgnV+KKref+oBwVHLZV3/c+l/Il6CvB6IhmbVAv+/IVwRVYP7aG5rXyLDgz7EkxFA
	0LEIzMfnsVs5FoddN8eiP+C6OtBGROfoZnBbE=
Received: by 10.100.44.4 with SMTP id r4mr7959831anr.100.1237912157959;
	Tue, 24 Mar 2009 09:29:17 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 5sm11894959ywl.58.2009.03.24.09.29.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 24 Mar 2009 09:29:17 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 34710610054; Tue, 24 Mar 2009 13:29:15 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <873ad462xj.fsf@neumann.lab.ossystems.com.br>
	<f96d234e0903240846s37d4bc77lfe7b31a4d6806262@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.91 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Tue, 24 Mar 2009 13:29:15 -0300
In-Reply-To: <f96d234e0903240846s37d4bc77lfe7b31a4d6806262@mail.gmail.com>
	(Cliff Brake's message of "Tue, 24 Mar 2009 11:46:44 -0400")
Message-ID: <87hc1i51gk.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Subject: Re: Problems with current workflow using PatchWork
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
X-List-Received-Date: Tue, 24 Mar 2009 16:30:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Cliff Brake <cliff.brake@gmail.com> writes:

> On Mon, Mar 23, 2009 at 4:47 AM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> Hello,
>>
>> Today I went to take a look if there were anything I could help with at
>> OE side and went to PatchWork to review pending patches and noticed a
>> cuple of issues.
>>
>> =C2=A0- we need to do more review cycles at PatchWork and update the sta=
tus
>> =C2=A0 according
>>
>> =C2=A0 There're applied patches that were not archived and patches that =
we
>> =C2=A0 asked for changes that hadn't the status changed to reflect it. T=
his
>> =C2=A0 way PW loses the main feature that is trackability of patch statu=
s.
>>
>> =C2=A0 Please commiters, when doing a commit please remember to archive =
the
>> =C2=A0 patch at PW.
>>
>> =C2=A0- merges need to be archived on PW
>>
>> =C2=A0 I noticed tha the RPM fixes went finally merged into the
>> =C2=A0 mainline. GREAT! But they were still listed as waiting for
>> =C2=A0 review. Since Marcin has commit, he did the merge but forgot to
>> =C2=A0 archive the whole set of patches at PW.
>>
>> =C2=A0 I suggest we when commiting our own patches take care of archiving
>> =C2=A0 them at PW to make life easier to everyone.
>
> Makes sense to me.  I have been archiving patches as I apply them, and
> selecting "Accepted".

Yes, some people has been doing it. I does it too.

However we _all_ need to do that or we lose time reviewing patches that
has already been applied.

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


