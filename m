Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S4tWn-0005w7-Hg
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 13:30:05 +0100
Received: by lagw12 with SMTP id w12so6176798lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2012 04:21:29 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.152.112.100 as permitted sender)
	client-ip=10.152.112.100; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.152.112.100 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.152.112.100])
	by 10.152.112.100 with SMTP id ip4mr22354453lab.1.1331036489941
	(num_hops = 1); Tue, 06 Mar 2012 04:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=0YQesCRfcBK07/TPGrA49iQoeCep3t+WPbO6Z6q0kXY=;
	b=GSt3K3UjYGqwqMzUtacpLHuEbpZHMIaFe1NRn2io1yQ8kL9l/eDuXuY7PeEHe60I4C
	n/c3AzSrdAIVt/reGVAe9N8/0ji9rMCCVjyTlJv2ByPb2sPbWDXfPOCuMe00acRq14w0
	pSojDbUoG/t2Eumd5AKpuCoQVLoA4iShRrZKt5C1PM5zMVjHTYWXLjRp4iSxg7HQgZhl
	EWRbw2GRg6p1QP8fSNwLCAEuhOo/vGtoqEMOuoCvhd8yfeTLXZ7zyOA9+FzRqtcb8NJc
	6XPKiYu/CfuxUBOKh64jNMJIcxDG8ZT/rqKqICHalDj0w21ZsHXtq2AEHEFmTZyKjh+1
	hZbA==
MIME-Version: 1.0
Received: by 10.152.112.100 with SMTP id ip4mr18306626lab.1.1331036489794;
	Tue, 06 Mar 2012 04:21:29 -0800 (PST)
Received: by 10.112.29.74 with HTTP; Tue, 6 Mar 2012 04:21:29 -0800 (PST)
In-Reply-To: <CAP9ODKovkJ_pHu+-__yUA=tshBiBvQwuJN7xN93P_6nrViZULw@mail.gmail.com>
References: <1331025741-26216-1-git-send-email-koen@dominion.thruhere.net>
	<1331025741-26216-2-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKo+i3d31+xUt8RnOgFeDQbUw4hSkHeoR1LomZvxF5oa8A@mail.gmail.com>
	<CAP9ODKovkJ_pHu+-__yUA=tshBiBvQwuJN7xN93P_6nrViZULw@mail.gmail.com>
Date: Tue, 6 Mar 2012 13:21:29 +0100
Message-ID: <CALbNGRTiaqQQPb_UqkCKrevZYJk4+LLUh9E2VDzAcHHC6v_sTw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2 2/3] systemd: enable logging to disk instead of tmpfs
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
X-List-Received-Date: Tue, 06 Mar 2012 12:30:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 6, 2012 at 12:59 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Tue, Mar 6, 2012 at 06:22, Koen Kooi <koen@dominion.thruhere.net> wrot=
e:
>> + =A0 =A0 =A0 # create dir for journal
>> + =A0 =A0 =A0 install -d ${D}${localstatedir}/log/journal
>
> I am not against it creating the path for storing the logs but the
> default configuration ought to use a memory buffer IMO.
>
> What people think?
>
To make up mind: Which amount of memory do we expect per boot
approximately (uncompressed/compressed)?

Andreas


