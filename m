Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1Sxqzd-0006TR-1v
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2012 04:55:01 +0200
Received: (qmail 30773 invoked by uid 1003); 5 Aug 2012 02:43:17 -0000
Received: from unknown (HELO ?192.168.1.105?) (philip@opensdr.com@71.171.25.17)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	5 Aug 2012 02:43:17 -0000
Message-ID: <501DDDC4.9040301@balister.org>
Date: Sat, 04 Aug 2012 22:43:16 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
In-Reply-To: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
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
X-List-Received-Date: Sun, 05 Aug 2012 02:55:01 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Shouldn't this patch go to the Angstrom list?

Philip

PS: I am guessing and am to lazy to check the README before I go to bed :)

On 08/04/2012 08:19 PM, Andreas Müller wrote:
> There are image recipes around requiring only a subset of what is found in
> angstrom-task-gnome(3) e.g. meta-ettus-images, angstrom images and mine [1].
> Unfortunately all recipes touched by angstrom-task-gnome(3) are build without
> being required/packed in the images. For xfce-nm-image this patch series reduces
> the number of task more than 700.
>
> [1] http://gitorious.org/schnitzeltony-oe-meta/meta-misc/blobs/master/recipes-image/xfce-base-image.bb
>
> Andreas Müller (16):
>    angstrom-task-gnome: split out task-gnome-apps
>    angstrom-task-gnome: split out task-gnome-fonts
>    angstrom-task-gnome: split out task-gnome
>    angstrom-task-gnome: split out task-gnome-gstreamer
>    angstrom-task-gnome: split out task-gnome-perl
>    angstrom-task-gnome: remove unused packages
>    angstrom-task-gnome: split out task-gnome-themes
>    angstrom-task-gnome: split out task-gnome-xserver-base
>    angstrom-task-gnome3: split out task-gnome3-apps
>    angstrom-task-gnome3: split out task-gnome3-fonts
>    angstrom-task-gnome3: split out task-gnome3
>    angstrom-task-gnome3: split out task-gnome3-gstreamer
>    angstrom-task-gnome3: split out task-gnome3-perl
>    angstrom-task-gnome3: remove unused packages
>    angstrom-task-gnome3: split out task-gnome3-themes
>    angstrom-task-gnome3: split out task-gnome3-xserver-base
>
>   recipes-angstrom/tasks/angstrom-task-gnome.bb     |  100 +--------------------
>   recipes-angstrom/tasks/angstrom-task-gnome3.bb    |   94 +-------------------
>   recipes-angstrom/tasks/task-gnome-apps.bb         |   14 +++
>   recipes-angstrom/tasks/task-gnome-fonts.bb        |   17 ++++
>   recipes-angstrom/tasks/task-gnome-gstreamer.bb    |   22 +++++
>   recipes-angstrom/tasks/task-gnome-perl.bb         |   15 +++
>   recipes-angstrom/tasks/task-gnome-themes.bb       |   35 +++++++
>   recipes-angstrom/tasks/task-gnome-xserver-base.bb |   25 +++++
>   recipes-angstrom/tasks/task-gnome.bb              |   26 ++++++
>   recipes-angstrom/tasks/task-gnome3-apps.bb        |   13 +++
>   recipes-angstrom/tasks/task-gnome3.bb             |   23 +++++
>   11 files changed, 193 insertions(+), 191 deletions(-)
>   create mode 100644 recipes-angstrom/tasks/task-gnome-apps.bb
>   create mode 100644 recipes-angstrom/tasks/task-gnome-fonts.bb
>   create mode 100644 recipes-angstrom/tasks/task-gnome-gstreamer.bb
>   create mode 100644 recipes-angstrom/tasks/task-gnome-perl.bb
>   create mode 100644 recipes-angstrom/tasks/task-gnome-themes.bb
>   create mode 100644 recipes-angstrom/tasks/task-gnome-xserver-base.bb
>   create mode 100644 recipes-angstrom/tasks/task-gnome.bb
>   create mode 100644 recipes-angstrom/tasks/task-gnome3-apps.bb
>   create mode 100644 recipes-angstrom/tasks/task-gnome3.bb
>


