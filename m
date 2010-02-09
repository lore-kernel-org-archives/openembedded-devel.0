Received: from mail-pz0-f184.google.com ([209.85.222.184])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msundius@sundius.com>) id 1NevPh-00076C-0E
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 20:06:24 +0100
Received: by pzk14 with SMTP id 14so518834pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Feb 2010 11:03:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.142.3.33 with SMTP id 33mr2154408wfc.275.1265742226722; Tue, 
	09 Feb 2010 11:03:46 -0800 (PST)
In-Reply-To: <1265741115.6761.30.camel@lenovo.internal.reciva.com>
References: <89CD81306A03F24FAEA2177A341C2C613B8764@XMB-RCD-209.cisco.com>
	<1265741115.6761.30.camel@lenovo.internal.reciva.com>
Date: Tue, 9 Feb 2010 11:03:46 -0800
Message-ID: <18e217241002091103g6e094c05h5050a6586d1ed693@mail.gmail.com>
From: C Michael Sundius <msundius@sundius.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.184
X-SA-Exim-Mail-From: msundius@sundius.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: initramfs image with secondary cramfs inside
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
X-List-Received-Date: Tue, 09 Feb 2010 19:06:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

>
> The default is to depend on populate_staging because the output from
> that task is, in general, what other packages need in order to build.
> But you can make your recipe depend on another task if you want; try (in
> your initramfs recipe):
>
> do_fetch[depends] = "cramfs-image:do_rootfs"
>
> p.
>
> works like a charm... thank you....

mike

