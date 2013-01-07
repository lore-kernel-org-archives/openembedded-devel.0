Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TsEyo-0000nv-ED
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jan 2013 16:51:14 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r07Fa4dV019115
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 7 Jan 2013 07:36:05 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Mon, 7 Jan 2013 07:36:03 -0800
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id C36C17FCE	for
	<openembedded-devel@lists.openembedded.org>;
	Mon,  7 Jan 2013 10:34:28 -0500 (EST)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id BC8882414F; Mon,
	7 Jan 2013 10:36:02 -0500 (EST)
Date: Mon, 7 Jan 2013 10:36:02 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130107153602.GD6154@windriver.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
	<1357463568-26241-9-git-send-email-raj.khem@gmail.com>
	<20130106093635.GB3272@jama>
	<CAMKF1sqXMaKrkpicDJLgZuWBzwTo3gyw_N3emL858GZfSZnwHw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqXMaKrkpicDJLgZuWBzwTo3gyw_N3emL858GZfSZnwHw@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH V2 09/25] atftp: Upgrade to latest from git
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
X-List-Received-Date: Mon, 07 Jan 2013 15:51:15 -0000
X-Groupsio-MsgNum: 42562
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C+ts3FVlLX8+P6JN"
Content-Disposition: inline

--C+ts3FVlLX8+P6JN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Khem,

[Re: [oe] [meta-oe][PATCH V2 09/25] atftp: Upgrade to latest from git] On 1=
3.01.06 (Sun 17:23) Khem Raj wrote:

> On Sun, Jan 6, 2013 at 1:36 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > On Sun, Jan 06, 2013 at 01:12:32AM -0800, Khem Raj wrote:
> >> Add patches to let atftp serve huge ramdisks >500M in size
> >
> > I don't see this patch
> > http://patchwork.openembedded.org/patch/41955/
> > in V2, can you update status on patchwork to indicate which patches are
> > superseeded by V2 and which are still valid?
> >
>=20
> I would suggest to actually drop all V1 patches since I have
> reshuffled them quite a bit and take all V2 fresh
> I have also pushed this latest series into contrib repo
>=20
> http://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dkraj/updat=
es

I'm looking at that now.  The only comment / request I have right now is
about atftp.  It was on my list of stuff to update and move into
meta-networking.  If there's no objection it that, would you mind moving
it there at the same time?  I'd been planning to have it in
meta-networking/recipes-daemons.

Thanks,
-J.

>=20
>=20
> > Thanks
> >
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  .../atftp/{atftp_0.7.bb =3D> atftp_git.bb}           |   18 +--
> >>  ...tpd-0.7_circumvent_tftp_size_restrictions.patch |  158 +++++++++++=
+++++++++
> >>  .../atftpd-0.7_unprotected_assignments_crash.patch |  145 +++++++++++=
+++++++
> >>  3 files changed, 311 insertions(+), 10 deletions(-)
> >>  rename meta-oe/recipes-extended/atftp/{atftp_0.7.bb =3D> atftp_git.bb=
} (59%)
> >>  create mode 100644 meta-oe/recipes-extended/atftp/files/atftpd-0.7_ci=
rcumvent_tftp_size_restrictions.patch
> >>  create mode 100644 meta-oe/recipes-extended/atftp/files/atftpd-0.7_un=
protected_assignments_crash.patch
> >>
> >> diff --git a/meta-oe/recipes-extended/atftp/atftp_0.7.bb b/meta-oe/rec=
ipes-extended/atftp/atftp_git.bb
> >> similarity index 59%
> >> rename from meta-oe/recipes-extended/atftp/atftp_0.7.bb
> >> rename to meta-oe/recipes-extended/atftp/atftp_git.bb
> >> index ff1e11d..774dd68 100644
> >> --- a/meta-oe/recipes-extended/atftp/atftp_0.7.bb
> >> +++ b/meta-oe/recipes-extended/atftp/atftp_git.bb
> >> @@ -3,13 +3,16 @@ SECTION =3D "network"
> >>  HOMEPAGE =3D "http://packages.debian.org/atftp"
> >>  LICENSE =3D "GPLv2"
> >>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D94d55d512a9ba36caa9b7df079=
bae19f"
> >> -PR =3D "r4"
> >> +PV =3D "0.7.1+git${SRCPV}"
> >>
> >> -SRC_URI =3D "${DEBIAN_MIRROR}/main/a/atftp/atftp_${PV}.dfsg.orig.tar.=
gz;name=3Darchive \
> >> -           ${DEBIAN_MIRROR}/main/a/atftp/atftp_${PV}.dfsg-11.diff.gz;=
name=3Dpatch \
> >> -           file://atftpd.init"
> >> +SRCREV =3D "be3291a18c069ae23a124ffdc56d64a5ff0bbec7"
> >>
> >> -S =3D "${WORKDIR}/atftp-${PV}.dfsg"
> >> +SRC_URI =3D "git://atftp.git.sourceforge.net/gitroot/atftp/atftp;prot=
ocol=3Dgit \
> >> +           file://atftpd-0.7_circumvent_tftp_size_restrictions.patch \
> >> +           file://atftpd-0.7_unprotected_assignments_crash.patch \
> >> +           file://atftpd.init \
> >> +          "
> >> +S =3D "${WORKDIR}/git"
> >>
> >>  inherit autotools update-rc.d useradd
> >>
> >> @@ -35,8 +38,3 @@ PACKAGES =3D+ "atftpd"
> >>  FILES_${PN} =3D "${bindir}/*"
> >>
> >>  FILES_${PN}d =3D "${sbindir}/* ${sysconfdir}/init.d/* /srv/tftp"
> >> -
> >> -SRC_URI[archive.md5sum] =3D "aa269044a6f992eca78fee2f6119643c"
> >> -SRC_URI[archive.sha256sum] =3D "18815f5b67290fac087c6b9da28dfa5e0feb7=
22096f5c5de52e59b46026da559"
> >> -SRC_URI[patch.md5sum] =3D "1636f199bf32c754a7bf34a5c647d138"
> >> -SRC_URI[patch.sha256sum] =3D "0df33f6c09c2b2de58a84d7bb757844fc9538cd=
4d6c8d9c463da5270ebc2e41d"
> >> diff --git a/meta-oe/recipes-extended/atftp/files/atftpd-0.7_circumven=
t_tftp_size_restrictions.patch b/meta-oe/recipes-extended/atftp/files/atftp=
d-0.7_circumvent_tftp_size_restrictions.patch
> >> new file mode 100644
> >> index 0000000..9aeb351
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-extended/atftp/files/atftpd-0.7_circumvent_tftp_=
size_restrictions.patch
> >> @@ -0,0 +1,158 @@
> >> +Fate #303031: Circumvent TFTP size restrictions in atftpd
> >> +The size of a single image file that can be transferred with TFTP is =
limited to
> >> +2^(2*8) *BLOCKSIZE (as per RFC 1350 there are only two bytes for the =
block
> >> +counter). This is problematic for one of our customers who needs to t=
ransfer
> >> +100+ MB Windows images using a TFTP client (NT bootloader) which has a
> >> +hardwared BLOCKSIZE setting of 1432).
> >> +
> >> +block rollover
> >> +http://www.compuphase.com/tftp.htm
> >> +
> >> +Index: git/tftp_def.h
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +--- git.orig/tftp_def.h      2012-11-19 16:28:50.221027144 -0800
> >> ++++ git/tftp_def.h   2012-11-20 17:40:54.391206979 -0800
> >> +@@ -32,6 +32,7 @@
> >> + #define TIMEOUT       5         /* Client timeout */
> >> + #define S_TIMEOUT     5         /* Server timout. */
> >> + #define NB_OF_RETRY   5
> >> ++#define MAXBLOCKS   1000000      /* maximum number of blocks in a do=
wnload */
> >> +
> >> + /* definition to use tftp_options structure */
> >> + #define OPT_FILENAME  0
> >> +Index: git/tftp_file.c
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +--- git.orig/tftp_file.c     2012-11-19 16:28:50.221027144 -0800
> >> ++++ git/tftp_file.c  2012-11-19 16:28:51.201027167 -0800
> >> +@@ -622,8 +622,8 @@
> >> +      int state =3D S_SEND_REQ;    /* current state in the state mach=
ine */
> >> +      int timeout_state =3D state; /* what state should we go on when=
 timeout */
> >> +      int result;
> >> +-     int block_number =3D 0;
> >> +-     int last_block =3D -1;
> >> ++     long block_number =3D 0;
> >> ++     long last_block =3D -1;
> >> +      int data_size;             /* size of data received */
> >> +      int sockfd =3D data->sockfd; /* just to simplify calls */
> >> +      struct sockaddr_storage sa; /* a copy of data.sa_peer */
> >> +@@ -637,8 +637,8 @@
> >> +      int convert =3D 0;           /* if true, do netascii convertion=
 */
> >> +      char string[MAXLEN];
> >> +
> >> +-     int prev_block_number =3D 0; /* needed to support netascii conv=
ertion */
> >> +-     int prev_file_pos =3D 0;
> >> ++     long prev_block_number =3D 0; /* needed to support netascii con=
vertion */
> >> ++     long prev_file_pos =3D 0;
> >> +      int temp =3D 0;
> >> +
> >> +      data->file_size =3D 0;
> >> +@@ -745,7 +745,7 @@
> >> +                               data_size, data->data_buffer);
> >> +                data->file_size +=3D data_size;
> >> +                if (data->trace)
> >> +-                    fprintf(stderr, "sent DATA <block: %d, size: %d>=
\n",
> >> ++                    fprintf(stderr, "sent DATA <block: %ld, size: %d=
>\n",
> >> +                             block_number + 1, data_size - 4);
> >> +                state =3D S_WAIT_PACKET;
> >> +                break;
> >> +@@ -785,7 +785,7 @@
> >> +                     }
> >> +                     block_number =3D ntohs(tftphdr->th_block);
> >> +                     if (data->trace)
> >> +-                         fprintf(stderr, "received ACK <block: %d>\n=
",
> >> ++                         fprintf(stderr, "received ACK <block: %ld>\=
n",
> >> +                                  block_number);
> >> +                     if ((last_block !=3D -1) && (block_number > last=
_block))
> >> +                     {
> >> +Index: git/tftp_io.c
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +--- git.orig/tftp_io.c       2012-11-19 16:28:50.221027144 -0800
> >> ++++ git/tftp_io.c    2012-11-19 16:28:51.201027167 -0800
> >> +@@ -350,8 +350,8 @@
> >> + /*
> >> +  * Read from file and do netascii conversion if needed
> >> +  */
> >> +-int tftp_file_read(FILE *fp, char *data_buffer, int data_buffer_size=
, int block_number,
> >> +-                   int convert, int *prev_block_number, int *prev_fi=
le_pos, int *temp)
> >> ++int tftp_file_read(FILE *fp, char *data_buffer, int data_buffer_size=
, long block_number,
> >> ++                   int convert, long *prev_block_number, long *prev_=
file_pos, int *temp)
> >> + {
> >> +      int i;
> >> +      int c;
> >> +Index: git/tftp_io.h
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +--- git.orig/tftp_io.h       2012-11-19 16:28:50.221027144 -0800
> >> ++++ git/tftp_io.h    2012-11-19 16:28:51.201027167 -0800
> >> +@@ -52,8 +52,8 @@
> >> + int tftp_get_packet(int sock1, int sock2, int *sock, struct sockaddr=
_storage *sa,
> >> +                     struct sockaddr_storage *from, struct sockaddr_s=
torage *to,
> >> +                     int timeout, int *size, char *data);
> >> +-int tftp_file_read(FILE *fp, char *buffer, int buffer_size, int bloc=
k_number, int convert,
> >> +-                   int *prev_block_number, int *prev_file_pos, int *=
temp);
> >> ++int tftp_file_read(FILE *fp, char *buffer, int buffer_size, long blo=
ck_number, int convert,
> >> ++                   long *prev_block_number, long *prev_file_pos, int=
 *temp);
> >> + int tftp_file_write(FILE *fp, char *data_buffer, int data_buffer_siz=
e, int block_number,
> >> +                     int data_size, int convert, int *prev_block_numb=
er, int *temp);
> >> + #endif
> >> +Index: git/tftpd_file.c
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +--- git.orig/tftpd_file.c    2012-11-19 16:28:50.225027144 -0800
> >> ++++ git/tftpd_file.c 2012-11-19 16:28:51.201027167 -0800
> >> +@@ -407,8 +407,9 @@
> >> +      int state =3D S_BEGIN;
> >> +      int timeout_state =3D state;
> >> +      int result;
> >> +-     int block_number =3D 0;
> >> +-     int last_block =3D -1;
> >> ++     long block_number =3D 0;
> >> ++     long last_block =3D -1;
> >> ++     int block_loops =3D 0;
> >> +      int data_size;
> >> +      struct sockaddr_storage *sa =3D &data->client_info->client;
> >> +      struct sockaddr_storage from;
> >> +@@ -431,8 +432,8 @@
> >> +      struct client_info *client_old =3D NULL;
> >> +      struct tftp_opt options[OPT_NUMBER];
> >> +
> >> +-     int prev_block_number =3D 0; /* needed to support netascii conv=
ertion */
> >> +-     int prev_file_pos =3D 0;
> >> ++     long prev_block_number =3D 0; /* needed to support netascii con=
vertion */
> >> ++     long prev_file_pos =3D 0;
> >> +      int temp =3D 0;
> >> +
> >> +      /* look for mode option */
> >> +@@ -565,11 +566,12 @@
> >> +           logger(LOG_INFO, "blksize option -> %d", result);
> >> +      }
> >> +
> >> +-     /* Verify that the file can be sent in 2^16 block of BLKSIZE oc=
tets */
> >> +-     if ((file_stat.st_size / (data->data_buffer_size - 4)) > 65535)
> >> ++     /* Verify that the file can be sent in MAXBLOCKS blocks of BLKS=
IZE octets */
> >> ++     if ((file_stat.st_size / (data->data_buffer_size - 4)) > MAXBLO=
CKS)
> >> +      {
> >> +           tftp_send_error(sockfd, sa, EUNDEF, data->data_buffer, dat=
a->data_buffer_size);
> >> +-          logger(LOG_NOTICE, "Requested file to big, increase BLKSIZ=
E");
> >> ++          logger(LOG_NOTICE, "Requested file too big, increase BLKSI=
ZE");
> >> ++          logger(LOG_NOTICE, "Only %d blocks of %d bytes can be serv=
ed.", MAXBLOCKS, data->data_buffer_size);
> >> +           if (data->trace)
> >> +                logger(LOG_DEBUG, "sent ERROR <code: %d, msg: %s>", E=
UNDEF,
> >> +                       tftp_errmsg[EUNDEF]);
> >> +@@ -880,10 +882,15 @@
> >> +                     }
> >> +                     /* The ACK is from the current client */
> >> +                     number_of_timeout =3D 0;
> >> +-                    block_number =3D ntohs(tftphdr->th_block);
> >> ++                    block_number =3D (block_loops * 65536) + ntohs(t=
ftphdr->th_block);
> >> +                     if (data->trace)
> >> +-                         logger(LOG_DEBUG, "received ACK <block: %d>=
",
> >> +-                                block_number);
> >> ++                    {
> >> ++                         logger(LOG_DEBUG, "received ACK <block: %d>=
", block_number);
> >> ++                    }
> >> ++                    if (ntohs(tftphdr->th_block) =3D=3D 65535)
> >> ++                    {
> >> ++                         block_loops++;
> >> ++                    };
> >> +                     if ((last_block !=3D -1) && (block_number > last=
_block))
> >> +                     {
> >> +                          state =3D S_END;
> >> diff --git a/meta-oe/recipes-extended/atftp/files/atftpd-0.7_unprotect=
ed_assignments_crash.patch b/meta-oe/recipes-extended/atftp/files/atftpd-0.=
7_unprotected_assignments_crash.patch
> >> new file mode 100644
> >> index 0000000..6faf5f9
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-extended/atftp/files/atftpd-0.7_unprotected_assi=
gnments_crash.patch
> >> @@ -0,0 +1,145 @@
> >> +Index: git/tftpd_list.c
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +--- git.orig/tftpd_list.c    2012-10-24 21:48:47.000000000 -0700
> >> ++++ git/tftpd_list.c 2012-10-24 21:52:04.266205076 -0700
> >> +@@ -49,11 +49,11 @@
> >> +  */
> >> + int tftpd_list_add(struct thread_data *new)
> >> + {
> >> +-     struct thread_data *current =3D thread_data;
> >> ++     struct thread_data *current;
> >> +      int ret;
> >> +
> >> +      pthread_mutex_lock(&thread_list_mutex);
> >> +-
> >> ++     current =3D thread_data;
> >> +      number_of_thread++;
> >> +
> >> +      ret =3D number_of_thread;
> >> +@@ -81,11 +81,13 @@
> >> +  */
> >> + int tftpd_list_remove(struct thread_data *old)
> >> + {
> >> +-     struct thread_data *current =3D thread_data;
> >> ++     struct thread_data *current;
> >> +      int ret;
> >> +
> >> +      pthread_mutex_lock(&thread_list_mutex);
> >> +
> >> ++     current =3D thread_data;
> >> ++
> >> +      number_of_thread--;
> >> +      ret =3D number_of_thread;
> >> +
> >> +@@ -137,23 +139,26 @@
> >> +                                              struct thread_data *dat=
a,
> >> +                                              struct client_info *cli=
ent)
> >> + {
> >> +-     struct thread_data *current =3D thread_data; /* head of the lis=
t */
> >> +-     struct tftp_opt *tftp_options =3D data->tftp_options;
> >> ++     struct thread_data *current; /* head of the list */
> >> ++     struct tftp_opt *tftp_options;
> >> +      struct client_info *tmp;
> >> +      char options[MAXLEN];
> >> +      char string[MAXLEN];
> >> +      char *index;
> >> +      int len;
> >> +
> >> ++     /* lock the whole list before walking it */
> >> ++     pthread_mutex_lock(&thread_list_mutex);
> >> ++
> >> +      *thread =3D NULL;
> >> +
> >> ++     current =3D thread_data;
> >> ++     tftp_options =3D data->tftp_options;
> >> ++
> >> +      opt_request_to_string(tftp_options, options, MAXLEN);
> >> +      index =3D strstr(options, "multicast");
> >> +      len =3D (int)index - (int)options;
> >> +
> >> +-     /* lock the whole list before walking it */
> >> +-     pthread_mutex_lock(&thread_list_mutex);
> >> +-
> >> +      while (current)
> >> +      {
> >> +           if (current !=3D data)
> >> +@@ -214,9 +219,10 @@
> >> + void tftpd_clientlist_remove(struct thread_data *thread,
> >> +                              struct client_info *client)
> >> + {
> >> +-     struct client_info *tmp =3D thread->client_info;
> >> ++     struct client_info *tmp;
> >> +
> >> +      pthread_mutex_lock(&thread->client_mutex);
> >> ++     tmp =3D thread->client_info;
> >> +      while ((tmp->next !=3D client) && (tmp->next !=3D NULL))
> >> +           tmp =3D tmp->next;
> >> +      if (tmp->next =3D=3D NULL)
> >> +@@ -231,9 +237,11 @@
> >> + void tftpd_clientlist_free(struct thread_data *thread)
> >> + {
> >> +      struct client_info *tmp;
> >> +-     struct client_info *head =3D thread->client_info;
> >> ++     struct client_info *head;
> >> +
> >> +      pthread_mutex_lock(&thread->client_mutex);
> >> ++     head =3D thread->client_info;
> >> ++
> >> +      while (head)
> >> +      {
> >> +           tmp =3D head;
> >> +@@ -250,9 +258,10 @@
> >> +                           struct client_info *client,
> >> +                           struct sockaddr_storage *sock)
> >> + {
> >> +-     struct client_info *head =3D thread->client_info;
> >> ++     struct client_info *head;
> >> +
> >> +      pthread_mutex_lock(&thread->client_mutex);
> >> ++     head =3D thread->client_info;
> >> +
> >> +      if (client)
> >> +      {
> >> +@@ -334,10 +343,10 @@
> >> +
> >> + void tftpd_list_kill_threads(void)
> >> + {
> >> +-     struct thread_data *current =3D thread_data; /* head of list */
> >> ++     struct thread_data *current; /* head of list */
> >> +
> >> +      pthread_mutex_lock(&thread_list_mutex);
> >> +-
> >> ++     current =3D thread_data;
> >> +
> >> +      while (current !=3D NULL)
> >> +      {
> >> +Index: git/tftpd_mcast.c
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +--- git.orig/tftpd_mcast.c   2012-10-24 21:48:47.000000000 -0700
> >> ++++ git/tftpd_mcast.c        2012-10-24 21:49:11.570201582 -0700
> >> +@@ -51,9 +51,11 @@
> >> +  */
> >> + int tftpd_mcast_get_tid(char **addr, short *port)
> >> + {
> >> +-     struct tid *current =3D tid_list;
> >> ++     struct tid *current;
> >> +
> >> +      pthread_mutex_lock(&mcast_tid_list);
> >> ++     current =3D tid_list;
> >> ++
> >> +      /* walk the list for a free tid */
> >> +      while (current !=3D NULL)
> >> +      {
> >> +@@ -74,9 +76,11 @@
> >> +
> >> + int tftpd_mcast_free_tid(char *addr, short port)
> >> + {
> >> +-     struct tid *current =3D tid_list;
> >> ++     struct tid *current;
> >> +
> >> +      pthread_mutex_lock(&mcast_tid_list);
> >> ++     current =3D tid_list;
> >> ++
> >> +      while (current !=3D NULL)
> >> +      {
> >> +       if ((current->used =3D=3D 1) && (current->port =3D=3D port) &&
> >> --
> >> 1.7.9.5
> >>
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
-Joe MacDonald.
:wq

--C+ts3FVlLX8+P6JN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlDq62IACgkQPN8S4W6ZZncuXgCeM9WZXWvBRBf6e3IuuXmbwuhH
wvkAnRxT1dyH8H37JPRSr3coTkPUtn4T
=d2za
-----END PGP SIGNATURE-----

--C+ts3FVlLX8+P6JN--
