Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KvDxg-0006sK-QE
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Oct 2008 17:32:00 +0100
Received: from [92.116.133.247] (helo=tamarin.localnet)
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KvDwh-0006Tj-9D
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Oct 2008 17:31:03 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Oct 2008 17:30:49 +0100
User-Agent: KMail/1.10.1 (Linux/2.6.27-7-generic; KDE/4.1.2; i686; ; )
MIME-Version: 1.0
Message-Id: <200810291730.49558.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 92.116.133.247
Subject: Packages not honoring our LDFLAGS
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
X-List-Received-Date: Wed, 29 Oct 2008 16:32:01 -0000
X-Groupsio-MsgNum: 6428
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_5+ICJ0gIomEdORx"

--Boundary-00=_5+ICJ0gIomEdORx
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hey,

I have enabled --hash-style=gnu some time ago but some packages do not honor 
this and I could need your help.

The attached list is a list of binaries and libraries not honoring our LDFLAGS 
and this list was compiled from a run of bitbake fso-image.

help would be appreciated.

	z.




--Boundary-00=_5+ICJ0gIomEdORx
Content-Type: text/plain;
  charset="us-ascii";
  name="fso-build-ignored-packages"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="fso-build-ignored-packages"

LDFLAGS ignored, libgps, /work/om-gta02-angstrom-linux-gnueabi/gpsd-2.34-r9/install/libgps/usr/lib/libgps.so.16.0.0
LDFLAGS ignored, python-pygps, /work/om-gta02-angstrom-linux-gnueabi/gpsd-2.34-r9/install/python-pygps/usr/lib/python2.5/site-packages/gpspacket.so
LDFLAGS ignored, gpsd-gpsctl, /work/om-gta02-angstrom-linux-gnueabi/gpsd-2.34-r9/install/gpsd-gpsctl/usr/bin/gpsctl
LDFLAGS ignored, gps-utils, /work/om-gta02-angstrom-linux-gnueabi/gpsd-2.34-r9/install/gps-utils/usr/bin/gpspipe
LDFLAGS ignored, gps-utils, /work/om-gta02-angstrom-linux-gnueabi/gpsd-2.34-r9/install/gps-utils/usr/bin/sirfmon
LDFLAGS ignored, gps-utils, /work/om-gta02-angstrom-linux-gnueabi/gpsd-2.34-r9/install/gps-utils/usr/bin/rtcmdecode
LDFLAGS ignored, gps-utils, /work/om-gta02-angstrom-linux-gnueabi/gpsd-2.34-r9/install/gps-utils/usr/bin/cgps
LDFLAGS ignored, gps-utils, /work/om-gta02-angstrom-linux-gnueabi/gpsd-2.34-r9/install/gps-utils/usr/bin/gpxlogger
LDFLAGS ignored, gps-utils, /work/om-gta02-angstrom-linux-gnueabi/gpsd-2.34-r9/install/gps-utils/usr/bin/cgpxlogger
LDFLAGS ignored, gps-utils, /work/om-gta02-angstrom-linux-gnueabi/gpsd-2.34-r9/install/gps-utils/usr/bin/gpsflash
LDFLAGS ignored, gpsd, /work/om-gta02-angstrom-linux-gnueabi/gpsd-2.34-r9/install/gpsd/usr/sbin/gpsd
LDFLAGS ignored, procps, /work/armv4t-angstrom-linux-gnueabi/procps-3.2.7-r5/install/procps/bin/kill.procps
LDFLAGS ignored, procps, /work/armv4t-angstrom-linux-gnueabi/procps-3.2.7-r5/install/procps/bin/ps.procps
LDFLAGS ignored, procps, /work/armv4t-angstrom-linux-gnueabi/procps-3.2.7-r5/install/procps/lib/libproc-3.2.7.so
LDFLAGS ignored, procps, /work/armv4t-angstrom-linux-gnueabi/procps-3.2.7-r5/install/procps/usr/bin/top.procps
LDFLAGS ignored, procps, /work/armv4t-angstrom-linux-gnueabi/procps-3.2.7-r5/install/procps/usr/bin/vmstat
LDFLAGS ignored, procps, /work/armv4t-angstrom-linux-gnueabi/procps-3.2.7-r5/install/procps/usr/bin/pgrep
LDFLAGS ignored, procps, /work/armv4t-angstrom-linux-gnueabi/procps-3.2.7-r5/install/procps/usr/bin/snice
LDFLAGS ignored, procps, /work/armv4t-angstrom-linux-gnueabi/procps-3.2.7-r5/install/procps/usr/bin/watch
LDFLAGS ignored, procps, /work/armv4t-angstrom-linux-gnueabi/procps-3.2.7-r5/install/procps/usr/bin/uptime.procps
LDFLAGS ignored, procps, /work/armv4t-angstrom-linux-gnueabi/procps-3.2.7-r5/install/procps/usr/bin/pmap
LDFLAGS ignored, procps, /work/armv4t-angstrom-linux-gnueabi/procps-3.2.7-r5/install/procps/usr/bin/tload
LDFLAGS ignored, procps, /work/armv4t-angstrom-linux-gnueabi/procps-3.2.7-r5/install/procps/usr/bin/w
LDFLAGS ignored, procps, /work/armv4t-angstrom-linux-gnueabi/procps-3.2.7-r5/install/procps/usr/bin/skill
LDFLAGS ignored, procps, /work/armv4t-angstrom-linux-gnueabi/procps-3.2.7-r5/install/procps/usr/bin/pwdx
LDFLAGS ignored, procps, /work/armv4t-angstrom-linux-gnueabi/procps-3.2.7-r5/install/procps/usr/bin/pkill
LDFLAGS ignored, procps, /work/armv4t-angstrom-linux-gnueabi/procps-3.2.7-r5/install/procps/usr/bin/slabtop
LDFLAGS ignored, procps, /work/armv4t-angstrom-linux-gnueabi/procps-3.2.7-r5/install/procps/usr/bin/free.procps
LDFLAGS ignored, procps, /work/armv4t-angstrom-linux-gnueabi/procps-3.2.7-r5/install/procps/sbin/sysctl.procps
LDFLAGS ignored, bzip2, /work/armv4t-angstrom-linux-gnueabi/bzip2-1.0.2-r1/install/bzip2/usr/lib/libbz2.so.1.0.2
LDFLAGS ignored, cups-lib, /work/armv4t-angstrom-linux-gnueabi/cups-1.2.12-r1/install/cups-lib/usr/lib/libcups.so.2
LDFLAGS ignored, cups-libimage, /work/armv4t-angstrom-linux-gnueabi/cups-1.2.12-r1/install/cups-libimage/usr/lib/libcupsimage.so.2
LDFLAGS ignored, ncurses, /work/armv4t-angstrom-linux-gnueabi/ncurses-5.4-r15/install/ncurses/usr/lib/libform.so.5.0.4
LDFLAGS ignored, ncurses, /work/armv4t-angstrom-linux-gnueabi/ncurses-5.4-r15/install/ncurses/usr/lib/libpanel.so.5.0.4
LDFLAGS ignored, ncurses, /work/armv4t-angstrom-linux-gnueabi/ncurses-5.4-r15/install/ncurses/usr/lib/libncurses.so.5.0.4
LDFLAGS ignored, ncurses, /work/armv4t-angstrom-linux-gnueabi/ncurses-5.4-r15/install/ncurses/usr/lib/libmenu.so.5.0.4
LDFLAGS ignored, sqlite, /work/armv4t-angstrom-linux-gnueabi/sqlite-2.8.17-r2/install/sqlite/usr/lib/libsqlite.so.0.8.6
LDFLAGS ignored, sqlite-bin, /work/armv4t-angstrom-linux-gnueabi/sqlite-2.8.17-r2/install/sqlite-bin/usr/bin/sqlite
LDFLAGS ignored, libvolume-id, /work/armv4t-angstrom-linux-gnueabi/udev-118-r3/install/libvolume-id/lib/libvolume_id.so.0.82.0
LDFLAGS ignored, libsdl-ttf, /work/armv4t-angstrom-linux-gnueabi/libsdl-ttf-2.0.3-r1/install/libsdl-ttf/usr/lib/libSDL_ttf-2.0.so.0.0.3
LDFLAGS ignored, e2fsprogs-blkid, /work/armv4t-angstrom-linux-gnueabi/e2fsprogs-1.38-r17/install/e2fsprogs-blkid/sbin/blkid
LDFLAGS ignored, e2fsprogs-uuidgen, /work/armv4t-angstrom-linux-gnueabi/e2fsprogs-1.38-r17/install/e2fsprogs-uuidgen/usr/bin/uuidgen
LDFLAGS ignored, e2fsprogs-e2fsck, /work/armv4t-angstrom-linux-gnueabi/e2fsprogs-1.38-r17/install/e2fsprogs-e2fsck/sbin/e2fsck.e2fsprogs
LDFLAGS ignored, e2fsprogs-mke2fs, /work/armv4t-angstrom-linux-gnueabi/e2fsprogs-1.38-r17/install/e2fsprogs-mke2fs/sbin/mke2fs.e2fsprogs
LDFLAGS ignored, e2fsprogs-fsck, /work/armv4t-angstrom-linux-gnueabi/e2fsprogs-1.38-r17/install/e2fsprogs-fsck/sbin/fsck.e2fsprogs
LDFLAGS ignored, e2fsprogs-tune2fs, /work/armv4t-angstrom-linux-gnueabi/e2fsprogs-1.38-r17/install/e2fsprogs-tune2fs/sbin/tune2fs
LDFLAGS ignored, e2fsprogs-badblocks, /work/armv4t-angstrom-linux-gnueabi/e2fsprogs-1.38-r17/install/e2fsprogs-badblocks/sbin/badblocks
LDFLAGS ignored, e2fsprogs, /work/armv4t-angstrom-linux-gnueabi/e2fsprogs-1.38-r17/install/e2fsprogs/usr/bin/chattr
LDFLAGS ignored, e2fsprogs, /work/armv4t-angstrom-linux-gnueabi/e2fsprogs-1.38-r17/install/e2fsprogs/usr/bin/lsattr
LDFLAGS ignored, e2fsprogs, /work/armv4t-angstrom-linux-gnueabi/e2fsprogs-1.38-r17/install/e2fsprogs/sbin/filefrag
LDFLAGS ignored, e2fsprogs, /work/armv4t-angstrom-linux-gnueabi/e2fsprogs-1.38-r17/install/e2fsprogs/sbin/mklost+found
LDFLAGS ignored, e2fsprogs, /work/armv4t-angstrom-linux-gnueabi/e2fsprogs-1.38-r17/install/e2fsprogs/sbin/resize2fs
LDFLAGS ignored, e2fsprogs, /work/armv4t-angstrom-linux-gnueabi/e2fsprogs-1.38-r17/install/e2fsprogs/sbin/debugfs
LDFLAGS ignored, e2fsprogs, /work/armv4t-angstrom-linux-gnueabi/e2fsprogs-1.38-r17/install/e2fsprogs/sbin/e2image
LDFLAGS ignored, e2fsprogs, /work/armv4t-angstrom-linux-gnueabi/e2fsprogs-1.38-r17/install/e2fsprogs/sbin/logsave
LDFLAGS ignored, e2fsprogs, /work/armv4t-angstrom-linux-gnueabi/e2fsprogs-1.38-r17/install/e2fsprogs/sbin/dumpe2fs
LDFLAGS ignored, libcrypto, /work/armv4t-angstrom-linux-gnueabi/openssl-0.9.7g-r7/install/libcrypto/usr/lib/libcrypto.so.0.9.7
LDFLAGS ignored, libssl, /work/armv4t-angstrom-linux-gnueabi/openssl-0.9.7g-r7/install/libssl/usr/lib/libssl.so.0.9.7
LDFLAGS ignored, openssl, /work/armv4t-angstrom-linux-gnueabi/openssl-0.9.7g-r7/install/openssl/usr/bin/openssl
LDFLAGS ignored, libpcap, /work/armv4t-angstrom-linux-gnueabi/libpcap-0.9.8-r3/install/libpcap/usr/lib/libpcap.so.0.9.6
LDFLAGS ignored, sysstat, /work/armv4t-angstrom-linux-gnueabi/sysstat-8.1.6-r0/install/sysstat/usr/bin/sar
LDFLAGS ignored, sysstat, /work/armv4t-angstrom-linux-gnueabi/sysstat-8.1.6-r0/install/sysstat/usr/bin/pidstat
LDFLAGS ignored, sysstat, /work/armv4t-angstrom-linux-gnueabi/sysstat-8.1.6-r0/install/sysstat/usr/bin/mpstat
LDFLAGS ignored, sysstat, /work/armv4t-angstrom-linux-gnueabi/sysstat-8.1.6-r0/install/sysstat/usr/bin/sadf
LDFLAGS ignored, sysstat, /work/armv4t-angstrom-linux-gnueabi/sysstat-8.1.6-r0/install/sysstat/usr/bin/iostat
LDFLAGS ignored, sysstat, /work/armv4t-angstrom-linux-gnueabi/sysstat-8.1.6-r0/install/sysstat/usr/lib/sa/sadc
LDFLAGS ignored, pth, /work/armv4t-angstrom-linux-gnueabi/pth-2.0.2-r1/install/pth/usr/lib/libpth.so.20.0.22
LDFLAGS ignored, perl-lib, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-lib/usr/lib/libperl.so.5.8.8
LDFLAGS ignored, perl-module-i18n-langinfo, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-i18n-langinfo/usr/lib/perl/5.8.8/auto/I18N/Langinfo/Langinfo.so
LDFLAGS ignored, perl-module-filter-util-call, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-filter-util-call/usr/lib/perl/5.8.8/auto/Filter/Util/Call/Call.so
LDFLAGS ignored, perl-module-sdbm-file, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-sdbm-file/usr/lib/perl/5.8.8/auto/SDBM_File/SDBM_File.so
LDFLAGS ignored, perl-module-b, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-b/usr/lib/perl/5.8.8/auto/B/B.so
LDFLAGS ignored, perl-module-b-c, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-b-c/usr/lib/perl/5.8.8/auto/B/C/C.so
LDFLAGS ignored, perl-module-unicode-normalize, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-unicode-normalize/usr/lib/perl/5.8.8/auto/Unicode/Normalize/Normalize.so
LDFLAGS ignored, perl-module-encode, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-encode/usr/lib/perl/5.8.8/auto/Encode/Encode.so
LDFLAGS ignored, perl-module-encode-cn, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-encode-cn/usr/lib/perl/5.8.8/auto/Encode/CN/CN.so
LDFLAGS ignored, perl-module-encode-unicode, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-encode-unicode/usr/lib/perl/5.8.8/auto/Encode/Unicode/Unicode.so
LDFLAGS ignored, perl-module-encode-symbol, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-encode-symbol/usr/lib/perl/5.8.8/auto/Encode/Symbol/Symbol.so
LDFLAGS ignored, perl-module-encode-tw, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-encode-tw/usr/lib/perl/5.8.8/auto/Encode/TW/TW.so
LDFLAGS ignored, perl-module-encode-jp, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-encode-jp/usr/lib/perl/5.8.8/auto/Encode/JP/JP.so
LDFLAGS ignored, perl-module-encode-byte, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-encode-byte/usr/lib/perl/5.8.8/auto/Encode/Byte/Byte.so
LDFLAGS ignored, perl-module-encode-kr, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-encode-kr/usr/lib/perl/5.8.8/auto/Encode/KR/KR.so
LDFLAGS ignored, perl-module-encode-ebcdic, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-encode-ebcdic/usr/lib/perl/5.8.8/auto/Encode/EBCDIC/EBCDIC.so
LDFLAGS ignored, perl-module-attrs, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-attrs/usr/lib/perl/5.8.8/auto/attrs/attrs.so
LDFLAGS ignored, perl-module-byteloader, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-byteloader/usr/lib/perl/5.8.8/auto/ByteLoader/ByteLoader.so
LDFLAGS ignored, perl-module-data-dumper, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-data-dumper/usr/lib/perl/5.8.8/auto/Data/Dumper/Dumper.so
LDFLAGS ignored, perl-module-mime-base64, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-mime-base64/usr/lib/perl/5.8.8/auto/MIME/Base64/Base64.so
LDFLAGS ignored, perl-module-ipc-sysv, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-ipc-sysv/usr/lib/perl/5.8.8/auto/IPC/SysV/SysV.so
LDFLAGS ignored, perl-module-io, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-io/usr/lib/perl/5.8.8/auto/IO/IO.so
LDFLAGS ignored, perl-module-socket, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-socket/usr/lib/perl/5.8.8/auto/Socket/Socket.so
LDFLAGS ignored, perl-module-list-util, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-list-util/usr/lib/perl/5.8.8/auto/List/Util/Util.so
LDFLAGS ignored, perl-module-digest-md5, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-digest-md5/usr/lib/perl/5.8.8/auto/Digest/MD5/MD5.so
LDFLAGS ignored, perl-module-cwd, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-cwd/usr/lib/perl/5.8.8/auto/Cwd/Cwd.so
LDFLAGS ignored, perl-module-file-glob, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-file-glob/usr/lib/perl/5.8.8/auto/File/Glob/Glob.so
LDFLAGS ignored, perl-module-re, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-re/usr/lib/perl/5.8.8/auto/re/re.so
LDFLAGS ignored, perl-module-sys-hostname, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-sys-hostname/usr/lib/perl/5.8.8/auto/Sys/Hostname/Hostname.so
LDFLAGS ignored, perl-module-sys-syslog, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-sys-syslog/usr/lib/perl/5.8.8/auto/Sys/Syslog/Syslog.so
LDFLAGS ignored, perl-module-posix, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-posix/usr/lib/perl/5.8.8/auto/POSIX/POSIX.so
LDFLAGS ignored, perl-module-time-hires, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-time-hires/usr/lib/perl/5.8.8/auto/Time/HiRes/HiRes.so
LDFLAGS ignored, perl-module-perlio-via, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-perlio-via/usr/lib/perl/5.8.8/auto/PerlIO/via/via.so
LDFLAGS ignored, perl-module-perlio-encoding, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-perlio-encoding/usr/lib/perl/5.8.8/auto/PerlIO/encoding/encoding.so
LDFLAGS ignored, perl-module-perlio-scalar, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-perlio-scalar/usr/lib/perl/5.8.8/auto/PerlIO/scalar/scalar.so
LDFLAGS ignored, perl-module-fcntl, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-fcntl/usr/lib/perl/5.8.8/auto/Fcntl/Fcntl.so
LDFLAGS ignored, perl-module-storable, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-storable/usr/lib/perl/5.8.8/auto/Storable/Storable.so
LDFLAGS ignored, perl-module-threads, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-threads/usr/lib/perl/5.8.8/auto/threads/threads.so
LDFLAGS ignored, perl-module-threads-shared, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-threads-shared/usr/lib/perl/5.8.8/auto/threads/shared/shared.so
LDFLAGS ignored, perl-module-xs-apitest, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-xs-apitest/usr/lib/perl/5.8.8/auto/XS/APItest/APItest.so
LDFLAGS ignored, perl-module-xs-typemap, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-xs-typemap/usr/lib/perl/5.8.8/auto/XS/Typemap/Typemap.so
LDFLAGS ignored, perl-module-devel-ppport, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-devel-ppport/usr/lib/perl/5.8.8/auto/Devel/PPPort/PPPort.so
LDFLAGS ignored, perl-module-devel-dprof, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-devel-dprof/usr/lib/perl/5.8.8/auto/Devel/DProf/DProf.so
LDFLAGS ignored, perl-module-devel-peek, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-devel-peek/usr/lib/perl/5.8.8/auto/Devel/Peek/Peek.so
LDFLAGS ignored, perl-module-opcode, /work/armv4t-angstrom-linux-gnueabi/perl-5.8.8-r26/install/perl-module-opcode/usr/lib/perl/5.8.8/auto/Opcode/Opcode.so
LDFLAGS ignored, ppp, /work/armv4t-angstrom-linux-gnueabi/ppp-2.4.3-r4/install/ppp/usr/sbin/chat
LDFLAGS ignored, ppp-oa, /work/armv4t-angstrom-linux-gnueabi/ppp-2.4.3-r4/install/ppp-oa/usr/lib/pppd/2.4.3/pppoatm.so
LDFLAGS ignored, ppp-oe, /work/armv4t-angstrom-linux-gnueabi/ppp-2.4.3-r4/install/ppp-oe/usr/lib/pppd/2.4.3/rp-pppoe.so
LDFLAGS ignored, ppp-oe, /work/armv4t-angstrom-linux-gnueabi/ppp-2.4.3-r4/install/ppp-oe/usr/sbin/pppoe-discovery
LDFLAGS ignored, ppp-radius, /work/armv4t-angstrom-linux-gnueabi/ppp-2.4.3-r4/install/ppp-radius/usr/lib/pppd/2.4.3/radattr.so
LDFLAGS ignored, ppp-radius, /work/armv4t-angstrom-linux-gnueabi/ppp-2.4.3-r4/install/ppp-radius/usr/lib/pppd/2.4.3/radrealms.so
LDFLAGS ignored, ppp-radius, /work/armv4t-angstrom-linux-gnueabi/ppp-2.4.3-r4/install/ppp-radius/usr/lib/pppd/2.4.3/radius.so
LDFLAGS ignored, ppp-winbind, /work/armv4t-angstrom-linux-gnueabi/ppp-2.4.3-r4/install/ppp-winbind/usr/lib/pppd/2.4.3/winbind.so
LDFLAGS ignored, ppp-minconn, /work/armv4t-angstrom-linux-gnueabi/ppp-2.4.3-r4/install/ppp-minconn/usr/lib/pppd/2.4.3/minconn.so
LDFLAGS ignored, ppp-password, /work/armv4t-angstrom-linux-gnueabi/ppp-2.4.3-r4/install/ppp-password/usr/lib/pppd/2.4.3/passprompt.so
LDFLAGS ignored, ppp-password, /work/armv4t-angstrom-linux-gnueabi/ppp-2.4.3-r4/install/ppp-password/usr/lib/pppd/2.4.3/passwordfd.so
LDFLAGS ignored, ppp-tools, /work/armv4t-angstrom-linux-gnueabi/ppp-2.4.3-r4/install/ppp-tools/usr/sbin/pppstats
LDFLAGS ignored, ppp-tools, /work/armv4t-angstrom-linux-gnueabi/ppp-2.4.3-r4/install/ppp-tools/usr/sbin/pppdump
LDFLAGS ignored, libglu, /work/armv4t-angstrom-linux-gnueabi/mesa-6.5.2-r1/install/libglu/usr/lib/libGLU.so.1.3.060502
LDFLAGS ignored, libosmesa, /work/armv4t-angstrom-linux-gnueabi/mesa-6.5.2-r1/install/libosmesa/usr/lib/libOSMesa.so.6.5.060502
LDFLAGS ignored, gdbm, /work/armv4t-angstrom-linux-gnueabi/gdbm-1.8.3-r2/install/gdbm/usr/lib/libgdbm.so.3.0.0
LDFLAGS ignored, libpython2, /work/armv4t-angstrom-linux-gnueabi/python-2.5.2-ml14/install/libpython2/usr/lib/libpython2.5.so.1.0
LDFLAGS ignored, libmikmod, /work/armv4t-angstrom-linux-gnueabi/libmikmod-3.2.0-beta2-r0/install/libmikmod/usr/lib/libmikmod.so.3.0.0
LDFLAGS ignored, wireless-tools, /work/armv4t-angstrom-linux-gnueabi/wireless-tools-29-r0/install/wireless-tools/usr/lib/libiw.so.29
LDFLAGS ignored, tcl, /work/armv4t-angstrom-linux-gnueabi/tcl-8.4.11-r6/install/tcl/usr/lib/libtcl8.4.so
LDFLAGS ignored, tk, /work/armv4t-angstrom-linux-gnueabi/tk-8.4.11-r5/install/tk/usr/lib/libtk8.4.so
LDFLAGS ignored, gcc, /work/armv4t-angstrom-linux-gnueabi/gcc-4.1.2-r14/install/gcc/usr/libexec/gcc/arm-angstrom-linux-gnueabi/4.1.2/collect2
LDFLAGS ignored, gcc, /work/armv4t-angstrom-linux-gnueabi/gcc-4.1.2-r14/install/gcc/usr/bin/arm-angstrom-linux-gnueabi-gcc
LDFLAGS ignored, g++, /work/armv4t-angstrom-linux-gnueabi/gcc-4.1.2-r14/install/g++/usr/libexec/gcc/arm-angstrom-linux-gnueabi/4.1.2/cc1plus
LDFLAGS ignored, g++, /work/armv4t-angstrom-linux-gnueabi/gcc-4.1.2-r14/install/g++/usr/bin/arm-angstrom-linux-gnueabi-g++
LDFLAGS ignored, cpp, /work/armv4t-angstrom-linux-gnueabi/gcc-4.1.2-r14/install/cpp/usr/libexec/gcc/arm-angstrom-linux-gnueabi/4.1.2/cc1
LDFLAGS ignored, cpp, /work/armv4t-angstrom-linux-gnueabi/gcc-4.1.2-r14/install/cpp/usr/bin/arm-angstrom-linux-gnueabi-cpp
LDFLAGS ignored, gcov, /work/armv4t-angstrom-linux-gnueabi/gcc-4.1.2-r14/install/gcov/usr/bin/arm-angstrom-linux-gnueabi-gcov
LDFLAGS ignored, libgcc, /work/armv4t-angstrom-linux-gnueabi/gcc-cross-4.1.2-r18/install/libgcc/lib/libgcc_s.so.1
LDFLAGS ignored, libstdc++, /work/armv4t-angstrom-linux-gnueabi/gcc-cross-4.1.2-r18/install/libstdc++/usr/lib/libstdc++.so.6.0.8


--Boundary-00=_5+ICJ0gIomEdORx--
