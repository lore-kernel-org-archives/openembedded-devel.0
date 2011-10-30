Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <david.thomas@microbee-systems.com>)
	id 1RKV5q-0003ab-TD for openembedded-devel@lists.openembedded.org;
	Sun, 30 Oct 2011 14:06:31 +0100
Received: by ywf9 with SMTP id 9so4859026ywf.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Oct 2011 06:00:26 -0700 (PDT)
Received: by 10.236.186.2 with SMTP id v2mr12197513yhm.83.1319979626729;
	Sun, 30 Oct 2011 06:00:26 -0700 (PDT)
Received: from [192.168.0.225] ([24.214.175.85])
	by mx.google.com with ESMTPS id z28sm21284047yhl.4.2011.10.30.06.00.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 30 Oct 2011 06:00:26 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: David Thomas <david.thomas@microbee-systems.com>
In-Reply-To: <CA+eR4cGOJUzp+JdZAzsiZBH=J_MSVy8+Mg48pFEiXcMSq39sQA@mail.gmail.com>
Date: Sun, 30 Oct 2011 08:00:28 -0500
Message-Id: <AA655079-FC52-4BF8-92A3-A95881DC1AD0@microbee-systems.com>
References: <CALJpqJw17ftFmyYbdBw8VZoEvdF54-tGGBj4QfHqEWKy5BqgGw@mail.gmail.com>
	<20111030103021.GA3822@rhein.zuhause.netz>
	<1240131A-F61F-49B7-9645-F34056E3ED88@microbee-systems.com>
	<CA+eR4cGOJUzp+JdZAzsiZBH=J_MSVy8+Mg48pFEiXcMSq39sQA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: Help?
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
X-List-Received-Date: Sun, 30 Oct 2011 13:06:31 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

I had a feeling it was a process issue. It is happening on bb.fire.event =
and so I was thinking it has something to do with that event wanting to =
do something unallowed.




On Oct 30, 2011, at 7:53 AM, Martin Panter wrote:

>>> On Sat, Oct 29, 2011 at 04:50:58PM -0500, David Thomas wrote:
>>>> File "/home/dthomas/bitbake/lib/bb/cooker.py", line 529, in
>>>> parseConfigurationFiles
>>>>   bb.event.fire(bb.event.ConfigParsed(), self.configuration.data)
>>>> IOError: [Errno 1] Operation not permitted
>=20
> =93Operation not permitted=94 is EPERM, which is different from =
EACCESS
> =93Permission denied=94. Normally you get the permission denied issue =
for
> file permission issues, and =93not permitted=94 for trying to do =
something
> like killing a root process as a normal user.
>=20
> Have you tried using strace on bitbake? See if you can find if there's
> an actual system call returning EPERM just before Python raises the
> IOError exception.
>=20
> -Marty
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



