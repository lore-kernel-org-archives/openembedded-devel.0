Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1S2hze-0001Nb-3t
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Feb 2012 12:46:50 +0100
Received: by iaag37 with SMTP id g37so819861iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Feb 2012 03:38:21 -0800 (PST)
Received-SPF: pass (google.com: domain of giuseppe.condorelli@gmail.com
	designates 10.50.153.201 as permitted sender)
	client-ip=10.50.153.201; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	giuseppe.condorelli@gmail.com designates 10.50.153.201 as
	permitted sender) smtp.mail=giuseppe.condorelli@gmail.com;
	dkim=pass header.i=giuseppe.condorelli@gmail.com
Received: from mr.google.com ([10.50.153.201])
	by 10.50.153.201 with SMTP id vi9mr6315607igb.59.1330515501277
	(num_hops = 1); Wed, 29 Feb 2012 03:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=7EIvBzovwh0RtLw91WyxR7kKwtfmqjzN5odVi9gq+MI=;
	b=QOGOlJ8gR46njIwpSBRXatGufYD1RZPhq1FDhGaCqcaHZ0nSV6pW0NvDinoN7kIVf6
	GEK9mZOXGZIpGp5o7lnxZ2I5Nxx35xhVL8hVBGtA/1vN/vBMB4kkq9iaOaU37nsRz1Rv
	dWhYi3jbNV4WfBAWjaHF50pKOae+55qE01Js0=
MIME-Version: 1.0
Received: by 10.50.153.201 with SMTP id vi9mr5254883igb.59.1330515501243; Wed,
	29 Feb 2012 03:38:21 -0800 (PST)
Received: by 10.231.182.68 with HTTP; Wed, 29 Feb 2012 03:38:21 -0800 (PST)
In-Reply-To: <CAOHjBZuNGJTAo=q0CGLTjQ3+KauV0F9YQbL+6cfAVHPT3=o__g@mail.gmail.com>
References: <CAOHjBZss6YRxsOedgF2v_A__XOgH0m=CZWj-OSGY+si+rOSsFQ@mail.gmail.com>
	<CAOHjBZuNGJTAo=q0CGLTjQ3+KauV0F9YQbL+6cfAVHPT3=o__g@mail.gmail.com>
Date: Wed, 29 Feb 2012 12:38:21 +0100
Message-ID: <CAOHjBZtqyjQxUv352FRxyZHYzCUVta+KuZs3kxywXFTBOUUP1Q@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: New task issue on linux-libc-headers
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
X-List-Received-Date: Wed, 29 Feb 2012 11:46:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Also running bitbake -b linux-libc-headers_<my_version> the NTASK task is
correctly executed after compile and before install

Il giorno mercoled=EC 29 febbraio 2012, Giuseppe Condorelli ha scritto:

> Moreover if, after the build failure, I perform a bitbake
> linux-libc-headers -c clean and then bitbake base-image ... magically
> do_NTASK is invoked by linux-libc-headers and also do_install too. What's
> happening!?
>
> Il giorno mercoled=EC 29 febbraio 2012, Giuseppe Condorelli ha scritto:
>
>> Hi all,
>>
>> I added an own task into my bbclass source (inherited by my conf file).
>> Let me to call the new task do_NTASK.
>> Into the bbclass I added:
>> addtask NTASK after do_compile before do_install
>> Then I run the base-image build and I noticed that NTASK is regularly
>> called but for linux-libc-headers, which do_install task doesn't execute=
 in
>> this situation. If I remove NTASK from the task list the do_install is r=
un
>> instead. This is causing a big trouble in my goal but I'm not understand=
ing
>> why...
>> Please do you have any suggestion?
>> Cheers,
>> Giuseppe
>>
>

