Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 8B9137783E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Mar 2017 13:40:44 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1488894044; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=pzl32KoIcxXudr3mTAk6+frfsdFx9YMUoNq0VgRFtwM=;
	b=NUgh51mydgiZc4mpLKuW33rqQPwFYpGJJrxBZz22Ol5kEULLi2Bz21DhPV+fl+492ds6+fQI
	/QoCaowbdP2wnL07RsS3EO2txZ2Zs4ETwDX7q2f7Zg5Csu1ILzkqHg3rLy1A5O6tyydlaNwM
	7KVGW8ea4Jit6/PWYy6I6w0oysE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Cc: Content-Type;
	b=dwQzSgkAhGgPeIGklIBzLP2+AXCMJO+6D1/wUbqrgP+hVRgfeK6Il8fDKmuSOK1QJe6qli
	AXCQVv7saZSCpgTeWeiz+mbpGsaodurd+m3tyxOv9KomHKwgF71mt6uQolWwyLuFIs2yWSaw
	X45RlWmr0ViAhjfIU19QGcfCblwOE=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mxa.mailgun.org with ESMTP id 58beb85c.7f7eb4364170-smtp-out-n03;
	Tue, 07 Mar 2017 13:40:44 -0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id g6so3500130ioj.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Mar 2017 05:40:44 -0800 (PST)
X-Gm-Message-State: AMke39mrTKCmg0eBYDpY4SCsC0bUlumOGCYR2TfPaGuugxVWXqLm8fHRUEkbGHOKJUtALRq7nMjvXRQPEtR4uw==
X-Received: by 10.107.138.14 with SMTP id m14mr818658iod.235.1488894044047;
	Tue, 07 Mar 2017 05:40:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.20.149 with HTTP; Tue, 7 Mar 2017 05:40:43 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1703070800350.11394@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703070800350.11394@uk63952.mitel.com>
From: Derek Straka <derek@asterius.io>
Date: Tue, 7 Mar 2017 08:40:43 -0500
X-Gmail-Original-Message-ID: <CADNbA1r4iok5GoZrmdNyucKHT1u16bG5WfGoh8=HTc72vrMPJw@mail.gmail.com>
Message-ID: <CADNbA1r4iok5GoZrmdNyucKHT1u16bG5WfGoh8=HTc72vrMPJw@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: Re: does specifying "--with-mpm=prefork" for apache2 require ugly manual hacking?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Mar 2017 13:40:44 -0000
Content-Type: text/plain; charset=UTF-8

Since they call out the specific version of 2.4.16, I assume this is based
on the jethro branch.  I suppose the multiprocessing module could probably
be a PACKAGECONFIG option[1].  There are several competing multiprocessing
modules that can be configured statically or as shared for dynamic loading
(event[1] vs worker[2] vs prefork[3]).

As far as the do_install_append goes, the installed configuration files for
apache get built up as part of the build from a set of templates in
./docs/conf/.  The uncommenting of the mpm line might be part of a
PACAKGECONFIG, but the other lines appear to be specific to their use case
rather than generally applicable to using the prefork module: for example,
they are setting the port to 8081 from port 80 (You can also specify the
port at configure time with --port=PORT).

-Derek

[1] - https://httpd.apache.org/docs/2.4/mpm.html
[2] - https://httpd.apache.org/docs/2.4/mod/event.html
[3] - https://httpd.apache.org/docs/2.4/mod/worker.html
[4] - https://httpd.apache.org/docs/2.4/mod/prefork.html

On Tue, Mar 7, 2017 at 8:05 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   just ran across the following situation in that an OE build
> (actually, wind river linux, but that should make no difference) has a
> bbappend file, "apache2_2.4.16.bbappend", that appears to be going to
> a great deal of trouble to simply specify "--with-mpm=prefork":
>
> EXTRA_OECONF += " --with-mpm=prefork "
>
> do_install_append() {
>                 # Make a backup of the original httpd.conf file
>     cp ${D}/${sysconfdir}/${BPN}/httpd.conf ${D}/${sysconfdir}/${BPN}/
> httpd.conf.orig
>
>     # Remove the two offending lines (to be replaced with the correct
> ones), as well as uncommenting the mpm include directive.
>     sed -r 's_^IncludeOptional\s+/etc/apache2/conf.d/\*.conf__' <
> ${D}/${sysconfdir}/${BPN}/httpd.conf.orig | sed -r
> 's_^IncludeOptional\s+/etc/apache2/modules.d/\*.conf__' | sed -r
> 's_^#Include\s+etc/apache2/extra/httpd-mpm.conf_Include
> etc/apache2/extra/httpd-mpm.conf_' | sed -r 's_^Listen 80$_Listen
> 80\n#Temporary use by minion\nListen 8081_' > ${D}/${sysconfdir}/${BPN}/
> httpd.conf
>
>     # Replacing the two lines removed previously with the correct ones.
> Loading the modules first, then configure them.
>     printf "\nIncludeOptional ${sysconfdir}/${BPN}/modules.d/*.load" >>
> ${D}/${sysconfdir}/${BPN}/httpd.conf
>     printf "\nIncludeOptional ${sysconfdir}/${BPN}/conf.d/*.conf" >>
> ${D}/${sysconfdir}/${BPN}/httpd.conf
> }
>
>   i'm unclear on what is happening above, but it seems that asking for
> a simple configuration like that should be available with something as
> basic as adding an option, or selecting PACKAGECONFIG.
>
>   am i missing something? is all of the above really necessary to do
> something that looks fairly straightforward?
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

