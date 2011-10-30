Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <david.thomas@microbee-systems.com>)
	id 1RKUJU-0002KW-Ms for openembedded-devel@lists.openembedded.org;
	Sun, 30 Oct 2011 13:16:32 +0100
Received: by ggnj1 with SMTP id j1so4843646ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Oct 2011 05:10:28 -0700 (PDT)
Received: by 10.236.136.70 with SMTP id v46mr11745251yhi.114.1319976628631;
	Sun, 30 Oct 2011 05:10:28 -0700 (PDT)
Received: from [192.168.0.225] ([24.214.175.85])
	by mx.google.com with ESMTPS id u66sm21111135yhu.13.2011.10.30.05.10.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 30 Oct 2011 05:10:27 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: David Thomas <david.thomas@microbee-systems.com>
In-Reply-To: <20111030103021.GA3822@rhein.zuhause.netz>
Date: Sun, 30 Oct 2011 07:10:31 -0500
Message-Id: <1240131A-F61F-49B7-9645-F34056E3ED88@microbee-systems.com>
References: <CALJpqJw17ftFmyYbdBw8VZoEvdF54-tGGBj4QfHqEWKy5BqgGw@mail.gmail.com>
	<20111030103021.GA3822@rhein.zuhause.netz>
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
X-List-Received-Date: Sun, 30 Oct 2011 12:16:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

I used Fedora 13 after trying to use 15. I ran into all sorts of issues =
with 15 and the last issue I encountered was gmake 3.82 and patch =
versions.=20

After working that angle for a while I downgraded to 13 as it had all =
the correct versions of gmake, etc. I did not install as root any =
package unless it was the only way to get it to install using sudo.

I ran it as root as a experiment after messing with trying to resolve =
this permissions issue for several days.=20
It is not a permissions issue in my OE directory, there is access taking =
place somewhere else in the file system it does not like but I cannot =
seem to resolve where this access attempt is taking place.

I went back in and reinstalled everything related to OE, same result. =
Time to toss in the towel and rebuild linux again?




On Oct 30, 2011, at 5:30 AM, Henning Heinold wrote:

> On Sat, Oct 29, 2011 at 04:50:58PM -0500, David Thomas wrote:
>> I can get bitbake to run as root but I don't let it continue as it is
>> not advised.
>>=20
>> As user I get this:
>>=20
>> Traceback (most recent call last):
>>  File "/home/dthomas/bitbake/bin/bitbake", line 234, in <module>
>>    ret =3D main()
>>  File "/home/dthomas/bitbake/bin/bitbake", line 197, in main
>>    server =3D ProcessServer(server_channel, event_queue, =
configuration)
>>  File "/home/dthomas/bitbake/lib/bb/server/process.py", line 78, in =
__init__
>>    self.cooker =3D BBCooker(configuration, =
self.register_idle_function)
>>  File "/home/dthomas/bitbake/lib/bb/cooker.py", line 77, in __init__
>>    self.parseConfigurationFiles(self.configuration.file)
>>  File "/home/dthomas/bitbake/lib/bb/cooker.py", line 529, in
>> parseConfigurationFiles
>>    bb.event.fire(bb.event.ConfigParsed(), self.configuration.data)
>> IOError: [Errno 1] Operation not permitted
>>=20
>>=20
>> I have tried everything. I am using Fedora 13 and have followed every
>=20
> Why don't use some more up to date distribution?
>=20
>> guide to the letter. It seems to be a permissions issue but where, I
>> have almost given up trying. As always, there is no info on the this
>> anywhere that is remotely useful
>>=20
>=20
> Use "ls -la" and "find" to find out permissions and ownership. Hence =
you used
> root user in the first place its likely there has something the wrong =
permisions.
>=20
> If nothing helps start from the beginning, that is most of time easier =
and faster.
>=20
>> Any help is appreciated?
> Sure.
>=20
> Bye Henning
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



