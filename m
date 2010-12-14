Received: from mail-gx0-f169.google.com ([209.85.161.169])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PSbQL-0002qs-82
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Dec 2010 21:24:37 +0100
Received: by gxk5 with SMTP id 5so749276gxk.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Dec 2010 12:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=26gbgdQkhC7HUxyYEeEV1ruPnt4BfJyNCp7lTfHUaKc=;
	b=a1ajhHFqPvOEKmGDo2Qa3PcU5TTYkg9BR3U2gQUB4W8ahp/FnM54q0aB6TbHQI3Gkk
	KWpC5duEO7uWWDFTTGRzApTQuL+l5J1XvH1r5TM4JrntFz0LdUqxYhSqDvaZkHLsFPjx
	hiSXOaPRff+c1/W7UEBgJjAn91gWCbfnzveFQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=V5DgfIiTtQh1NTfrvIPc6kts38+TUHm67Jx7BJbnjgRFLDwMN38z8KuiYLqPr88oXY
	gdoO6t3t2arpzK6LrpfhRRQywA5mgpjnA1NihbAIHuYD6AHIbmvjovzGJJ04R6UGt/X7
	eUHqe2ZYL1AYjnTUdIodB42ZQb4o3hU+5+FTY=
Received: by 10.91.163.27 with SMTP id q27mr7264733ago.139.1292358178848; Tue,
	14 Dec 2010 12:22:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Tue, 14 Dec 2010 12:22:38 -0800 (PST)
In-Reply-To: <AANLkTinvRwriJ=W50duDtc50t2fCT5PM_3-D6Ec8VwM5@mail.gmail.com>
References: <AANLkTik3B0Boi4PuUqZiSd8no_BwBoSzcgWVmFcKcY3L@mail.gmail.com>
	<AANLkTinvRwriJ=W50duDtc50t2fCT5PM_3-D6Ec8VwM5@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Dec 2010 12:22:38 -0800
Message-ID: <AANLkTi=ZP2qTYw3A6KGKppb82D-hoc1LQFQ2DGjbHxN0@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.169
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: task-sdk-native hard-coded to depend on sysvinit
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
X-List-Received-Date: Tue, 14 Dec 2010 20:24:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 13, 2010 at 2:19 PM, AJ ONeal <coolaj86@gmail.com> wrote:
> actually, the error only seems to happen when another package is installe=
d
> or when it is part of a my-custom-image.bb - which is a problem since I w=
ant
> to install both it and upstart.

if there are conflicts then probably you need something like a compat packa=
ge
where you can make sure that the bits that conflict are taken care of
upstart and sysvinit are conflicting
packages.

>
> opkg install python python-misc task-sdk-native
>
> when I tried it all on it's lonesome it worked.
>
> AJ ONeal
>
> On Mon, Dec 13, 2010 at 2:27 PM, AJ ONeal <coolaj86@gmail.com> wrote:
>
>> Why should task-sdk-native depend on sysvinit in the first place?
>>
>> And in the second place, isn't there something like virtual/init that it
>> should depend on instead?
>>
>> opkg install task-sdk-native
>>
>> Collected errors:
>> =C2=A0* check_data_file_clashes: Package sysvinit wants to install file
>> /sbin/telinit
>> =C2=A0 =C2=A0 But that file is already provided by package =C2=A0* upsta=
rt-sysvcompat
>> =C2=A0* check_data_file_clashes: Package sysvinit wants to install file
>> /sbin/killall5
>> =C2=A0 =C2=A0 But that file is already provided by package =C2=A0* sysvi=
nit-utils
>> =C2=A0* check_data_file_clashes: Package sysvinit wants to install file
>> /etc/init.d/rc
>> =C2=A0 =C2=A0 But that file is already provided by package =C2=A0* upsta=
rt-sysvcompat
>> =C2=A0* check_data_file_clashes: Package sysvinit wants to install file
>> /etc/init.d/rcS
>> =C2=A0 =C2=A0 But that file is already provided by package =C2=A0* upsta=
rt-sysvcompat
>> =C2=A0* check_data_file_clashes: Package sysvinit wants to install file
>> /etc/default/rcS
>> =C2=A0 =C2=A0 But that file is already provided by package =C2=A0* upsta=
rt-sysvcompat
>> =C2=A0* opkg_install_cmd: Cannot install package task-sdk-native.
>>
>>
>> AJ ONeal
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


