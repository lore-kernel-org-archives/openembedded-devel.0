Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UM2N7-0000gk-IU
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Mar 2013 21:27:29 +0100
Received: by mail-oa0-f47.google.com with SMTP id o17so1131605oag.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Mar 2013 13:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Dph3UNOjcWvPY3jatG//Jr6OuVVn7cu0IyZcT7eH2Tw=;
	b=KOJPkbzCpCwXfAwwA2cQVHcycx6EPamHY+VyS51yoZL0dvqrVWQlx7umxiilOIfqDW
	BqhaD46KP/cIKzcffRWS6guyT1omsf92oyeo8ndGt1twr1wKsfN+83KsciYVk1cQDML6
	u+R0exiNOMbYJlh2D0BQzJLnVXoIemGP7pYInFvQvneqEVRRwqOLeo0qNYzGpikaCvW6
	+OS75m+E0r6yHOpJxMA41qwGgdv+/+T+5g6SggS8U+jBX14qBNAug66jT4kryiI+94V7
	6cFI8Q+BQQmQNFl7bnSxM5qIKBkVHERronpmXUXJ7F61aZkEVlSbDi3JBA7rBKaijlgQ
	kO+A==
MIME-Version: 1.0
X-Received: by 10.60.63.73 with SMTP id e9mr40194oes.87.1364674223088; Sat, 30
	Mar 2013 13:10:23 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Sat, 30 Mar 2013 13:10:22 -0700 (PDT)
In-Reply-To: <CA+T6QPm1H5g_Pu029vi4Yc8GcEDsb3jRgw8oTFc_UHQbad3g0Q@mail.gmail.com>
References: <1357139774-4364-1-git-send-email-schnitzeltony@googlemail.com>
	<1357139774-4364-2-git-send-email-schnitzeltony@googlemail.com>
	<CA+T6QPnFy=OAdiAi7H0avHn0AK-qbtEbMBBkizF7OWYtL4qGyQ@mail.gmail.com>
	<CA+T6QPm1H5g_Pu029vi4Yc8GcEDsb3jRgw8oTFc_UHQbad3g0Q@mail.gmail.com>
Date: Sat, 30 Mar 2013 17:10:22 -0300
X-Google-Sender-Auth: hbKGJSt7ph5KpXwIXP-E9PDFM2Y
Message-ID: <CAP9ODKp7m02Wfj7AQYULFebwPpahvEzZJ9hR135CETwUtRswUQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce/meta-gnome/V2 01/10] exo: update to 0.10.2
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
X-List-Received-Date: Sat, 30 Mar 2013 20:27:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 30, 2013 at 2:14 PM, Jason Kridner <jkridner@beagleboard.org> w=
rote:
> On Sat, Mar 30, 2013 at 1:05 PM, Jason Kridner <jkridner@beagleboard.org>=
 wrote:
>> On Wed, Jan 2, 2013 at 10:16 AM, Andreas M=FCller
>> <schnitzeltony@googlemail.com> wrote:
>>>
>>> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
>>> ---
>>>  meta-xfce/recipes-xfce/exo/exo/configure.patch     |    4 ++--
>>>  .../exo/{exo_0.8.0.bb =3D> exo_0.10.2.bb}            |    4 ++--
>>>  2 files changed, 4 insertions(+), 4 deletions(-)
>>>  rename meta-xfce/recipes-xfce/exo/{exo_0.8.0.bb =3D> exo_0.10.2.bb} (8=
7%)
>>
>>
>> There seems to be a missing dependency on some Perl modules[1]:
>>
>> | checking for perl module URI::Escape... no
>> | checking for perl module URI::file... no
>> | checking for perl module URI::URL... no
>> | configure: error: Atleast one of the required Perl modules
>> (URI::Escape, URI::file and URI::URL) was not found on your system
>> | Configure failed. The contents of all config.log files follows to
>> aid debugging
>>
>> [1] https://s3.amazonaws.com/beagleboard/angstrom-2013-03-30-16%3A24%3A1=
3/build.log
>>
>> I'm working on a patch.
>
> k, it seems that the builds use the Perl packages in the host system
> and not perl-native, so probably the right thing to do is for me to
> simply add it to my host system.

This is the wrong fix.

> For Ubuntu, that is 'sudo apt-get install liburi-perl'.
>
> Is this something we'd want to avoid having as a host dependency in the f=
uture?

As Martin said, add inherit perlnative and the dependency; it should fix it=
.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


