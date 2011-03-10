Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <zach.frey@gmail.com>) id 1PxlfI-0000Rc-Nh
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Mar 2011 20:36:53 +0100
Received: by pvc30 with SMTP id 30so336651pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2011 11:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=O1CwxjCnGiZ5LjyYjtqT9fuvRf67FMUI4nGZtbna4+A=;
	b=TPncjC5nP8L3J4jTmATrPkYdGwil8DRZeJhNlNgaXLOfiMhmGT2VsF4rxapTRNFmeK
	YrjxdrzV2qfTLZAlJ5tonV8bUykMJylRX+Vhb0bFDDH2kKMbNxA9yKYMwPWBSe7YT4te
	+gHAvD4ARY0fW3ybkzH8i6swIngjEMzKqoufM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=YHPR8L3FVF0SYKzWbt+r+skoy8N+/aZ7ow63bgenJxiLgOtTDvT7BqwycjmL3kgNkB
	+fg0N9FP7OLdE1SFhWg6wYIbYhdsM++GzNDC3F+qEWJrzWkNqviwiOc3+3NRlyvMAfz1
	7DPYAlvw9xrnHnWznPy5t8d3aBH7nG+x7akJM=
MIME-Version: 1.0
Received: by 10.142.178.17 with SMTP id a17mr6855716wff.65.1299785706148; Thu,
	10 Mar 2011 11:35:06 -0800 (PST)
Sender: zach.frey@gmail.com
Received: by 10.143.31.21 with HTTP; Thu, 10 Mar 2011 11:35:06 -0800 (PST)
In-Reply-To: <AANLkTikdwVG8D6v20mDMEfLcLbgLOHUHdYSVp9_LVxDU@mail.gmail.com>
References: <AANLkTikdwVG8D6v20mDMEfLcLbgLOHUHdYSVp9_LVxDU@mail.gmail.com>
Date: Thu, 10 Mar 2011 14:35:06 -0500
X-Google-Sender-Auth: xKF1fmEJlvhcMyXeTWqochPQhZ0
Message-ID: <AANLkTinqNVO8a0PBSpRHFRTVwsf5wbYmBi+PQMgDPmV=@mail.gmail.com>
From: Zach Frey <zach@znfrey.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: dbus-1.4.1 do_fetch fails
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
X-List-Received-Date: Thu, 10 Mar 2011 19:36:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

OK, never mind -- should have realized I need to be checking the
originally-downloaded archive.  It must have been a genuine download
corruption, as 'bitbake -c distclean dbus-native' and retrying fixes it.

Sorry for the list noise.

Thanks,
Zach

On Thu, Mar 10, 2011 at 10:21 AM, Zach Frey <zach@znfrey.com> wrote:

> Hi,
>
> I'm seeing the following with today's pull:
>
> Build Configuration:
> BB_VERSION        = "1.10.2"
> METADATA_BRANCH   = "master"
> METADATA_REVISION = "40a8506"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "omapzoom2"
> DISTRO            = "angstrom"
> DISTRO_VERSION    = "v20110310"
> TARGET_FPU        = "hard"
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> FATAL: dbus-native-1.4.1:
> http://dbus.freedesktop.org/releases/dbus/dbus-1.4.1.tar.gz cannot check
> archive integrity
> ERROR: Error in executing python function in:
> /home/PHOENIX/frey/OE/openembedded/recipes/dbus/dbus_1.4.1.bb
> ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
> ERROR: Printing the environment of the function
> ERROR: Function base_do_fetch failed
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of
> virtual:native:/home/PHOENIX/frey/OE/openembedded/recipes/dbus/
> dbus_1.4.1.bb do_fetch failed
> NOTE: Running task 748 of 8673 (ID: 8190,
> virtual:native:/home/PHOENIX/frey/OE/openembedded/recipes/dbus/
> dbus_1.4.1.bb, do_fetch)
> ERROR: Task 8190
> (virtual:native:/home/PHOENIX/frey/OE/openembedded/recipes/dbus/
> dbus_1.4.1.bb, do_fetch) failed with 256
> ERROR: 'virtual:native:/home/PHOENIX/frey/OE/openembedded/recipes/dbus/
> dbus_1.4.1.bb' failed
> NOTE: package dbus-native-1.4.1-r20.0: task do_fetch: Started
> NOTE: The checksums for
> '/home/PHOENIX/frey/OE/build/tmp/downloads/dbus-1.4.1.tar.gz' did not match.
> Expected MD5: '99cb057700c0455fb68f8d57902f77ac' and Got:
> '4f3cb09d463197535a7934eff8d0eea8'
> Expected SHA256:
> 'caa1a0ded2d0f2e95c1d4ec7e3c8bd44834928c5b0ed41a7189963f3593983bd' and Got:
> 'c8dea9aa33ea3669ad5fb3ff277332e380f70fc768c7e39c8b2a1e278eeec66b'
> NOTE: Your checksums:
> SRC_URI[md5sum] = "4f3cb09d463197535a7934eff8d0eea8"
> SRC_URI[sha256sum] =
> "c8dea9aa33ea3669ad5fb3ff277332e380f70fc768c7e39c8b2a1e278eeec66b"
>
> FATAL: dbus-native-1.4.1:
> http://dbus.freedesktop.org/releases/dbus/dbus-1.4.1.tar.gz cannot check
> archive integrity
> ERROR: 'virtual:native:/home/PHOENIX/frey/OE/openembedded/recipes/dbus/
> dbus_1.4.1.bb' failed
>
>
> Downloading http://dbus.freedesktop.org/releases/dbus/dbus-1.4.1.tar.gzdirectly and doing untar/configure/make seems to indicate that the source
> archive isn't corrupted.
>
> What is the next step?  Is there anything more I should report for this
> error?
>
> Thanks,
> Zach
>
>
>

