Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SxutX-0007Ky-9Z
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2012 09:05:01 +0200
Received: by obc16 with SMTP id 16so426927obc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2012 23:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=sbp4oFJW8oyOyEOBUXFmE7SVMJjqJP2zIDQXXOV8up4=;
	b=hEm8YnWZVaaQAE5vZwdVdMXgdI1/tBOMoqJNshq3tgNE/iYY8yy5OvBLEM/P/11Cla
	pObUeNMGZ3FtpF4Wx47ou4CwD/P3J4EIBlkVfC5od618vVJVObst3CkHK9QN5myHscLS
	4L2kMwRo8K5j7tPdDAqYtyGsRZX1zZo8GNWS6VOHWDuJ2w3N+XK94Ehs30oVdGnDYPf7
	mKlvi/nCBtacjeoooaRiqTHglSkX6PzqLpU08P4q5sjEJGJa28MTjjjsrUQYV2uCiXG1
	RfjXyZM/UoAIhbNgjCawsfSQKMEvx1NN9mXK5+S0XIiLlNSTVuly1e2dj5NHWmsZPNKO
	twvQ==
MIME-Version: 1.0
Received: by 10.50.156.201 with SMTP id wg9mr2528349igb.45.1344149595312; Sat,
	04 Aug 2012 23:53:15 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Sat, 4 Aug 2012 23:53:15 -0700 (PDT)
In-Reply-To: <501DDDC4.9040301@balister.org>
References: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
	<501DDDC4.9040301@balister.org>
Date: Sun, 5 Aug 2012 08:53:15 +0200
Message-ID: <CALbNGRSToYmnu-2nj82cucV5FiGMeYaechEJ+X4dyqdUg=N+iA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-angstrom 00/16] split tasks into recipes to reduce number of build tasks
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
X-List-Received-Date: Sun, 05 Aug 2012 07:05:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 5, 2012 at 4:43 AM, Philip Balister <philip@balister.org> wrote=
:
> Shouldn't this patch go to the Angstrom list?
You are right but from my experience the response on angstrom list is
weak and as far as I know there is no patchwork for angstrom.

Andreas
>
> Philip
>
> PS: I am guessing and am to lazy to check the README before I go to bed :=
)
>
>
> On 08/04/2012 08:19 PM, Andreas M=FCller wrote:
>>
>> There are image recipes around requiring only a subset of what is found =
in
>> angstrom-task-gnome(3) e.g. meta-ettus-images, angstrom images and mine
>> [1].
>> Unfortunately all recipes touched by angstrom-task-gnome(3) are build
>> without
>> being required/packed in the images. For xfce-nm-image this patch series
>> reduces
>> the number of task more than 700.
>>
>> [1]
>> http://gitorious.org/schnitzeltony-oe-meta/meta-misc/blobs/master/recipe=
s-image/xfce-base-image.bb
>>
>> Andreas M=FCller (16):
>>    angstrom-task-gnome: split out task-gnome-apps
>>    angstrom-task-gnome: split out task-gnome-fonts
>>    angstrom-task-gnome: split out task-gnome
>>    angstrom-task-gnome: split out task-gnome-gstreamer
>>    angstrom-task-gnome: split out task-gnome-perl
>>    angstrom-task-gnome: remove unused packages
>>    angstrom-task-gnome: split out task-gnome-themes
>>    angstrom-task-gnome: split out task-gnome-xserver-base
>>    angstrom-task-gnome3: split out task-gnome3-apps
>>    angstrom-task-gnome3: split out task-gnome3-fonts
>>    angstrom-task-gnome3: split out task-gnome3
>>    angstrom-task-gnome3: split out task-gnome3-gstreamer
>>    angstrom-task-gnome3: split out task-gnome3-perl
>>    angstrom-task-gnome3: remove unused packages
>>    angstrom-task-gnome3: split out task-gnome3-themes
>>    angstrom-task-gnome3: split out task-gnome3-xserver-base
>>
>>   recipes-angstrom/tasks/angstrom-task-gnome.bb     |  100
>> +--------------------
>>   recipes-angstrom/tasks/angstrom-task-gnome3.bb    |   94
>> +-------------------
>>   recipes-angstrom/tasks/task-gnome-apps.bb         |   14 +++
>>   recipes-angstrom/tasks/task-gnome-fonts.bb        |   17 ++++
>>   recipes-angstrom/tasks/task-gnome-gstreamer.bb    |   22 +++++
>>   recipes-angstrom/tasks/task-gnome-perl.bb         |   15 +++
>>   recipes-angstrom/tasks/task-gnome-themes.bb       |   35 +++++++
>>   recipes-angstrom/tasks/task-gnome-xserver-base.bb |   25 +++++
>>   recipes-angstrom/tasks/task-gnome.bb              |   26 ++++++
>>   recipes-angstrom/tasks/task-gnome3-apps.bb        |   13 +++
>>   recipes-angstrom/tasks/task-gnome3.bb             |   23 +++++
>>   11 files changed, 193 insertions(+), 191 deletions(-)
>>   create mode 100644 recipes-angstrom/tasks/task-gnome-apps.bb
>>   create mode 100644 recipes-angstrom/tasks/task-gnome-fonts.bb
>>   create mode 100644 recipes-angstrom/tasks/task-gnome-gstreamer.bb
>>   create mode 100644 recipes-angstrom/tasks/task-gnome-perl.bb
>>   create mode 100644 recipes-angstrom/tasks/task-gnome-themes.bb
>>   create mode 100644 recipes-angstrom/tasks/task-gnome-xserver-base.bb
>>   create mode 100644 recipes-angstrom/tasks/task-gnome.bb
>>   create mode 100644 recipes-angstrom/tasks/task-gnome3-apps.bb
>>   create mode 100644 recipes-angstrom/tasks/task-gnome3.bb
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


