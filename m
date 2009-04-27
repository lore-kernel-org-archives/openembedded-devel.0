Received: from [74.125.44.153] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LyQMS-0002mv-UP
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Apr 2009 14:55:05 +0200
Received: by yx-out-1718.google.com with SMTP id 36so1448186yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2009 05:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=30/+UuDF7J3kF1Ea7jquZbP4BVZQmsysxs9VoGn2Nbk=;
	b=v8yiPQGm8nBP4ixzNIZblEhBs/kCCGA9xJaJvZ5ZzaC9alTfD2MOdp1RFCvorIMqAq
	JZmUJ+qWLzLwwfAbOGLFPsoNBAUP1G5e7kJ+OVekddfy7TiySKxaxEVE009g9bVHszAt
	Lo7jA244go5Qqa10GhMmulH3H3z05QN/STDvo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=jaj4ZmPyJBMz2j29qtuo5L0bH0XKMEO3+FhDzfFmwjilgkpPznFnwNcFp8TC4pMv3a
	exst/ZMktPqmnIduRpo0iiOWMSukao1TnTzJYyPaPmXyKNz6Na3xWevA+0/JuUzdvHGm
	k4Es3SihSHBl3duTFRV96ELF5M7CT3lSH6UtE=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.211.11 with SMTP id j11mr8529709ang.101.1240836601472; 
	Mon, 27 Apr 2009 05:50:01 -0700 (PDT)
In-Reply-To: <1240829698-28666-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1240829698-28666-1-git-send-email-marcin@juszkiewicz.com.pl>
Date: Mon, 27 Apr 2009 09:50:01 -0300
X-Google-Sender-Auth: 80863a1c3410237b
Message-ID: <be7a9f3d0904270550w7627f927g643a37959d39034a@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/1] genext2fs: added 1.4.1 version
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
X-List-Received-Date: Mon, 27 Apr 2009 12:55:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Mon, Apr 27, 2009 at 7:54 AM, Marcin Juszkiewicz
<marcin@juszkiewicz.com.pl> wrote:
>
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> ---
> =A0conf/checksums.ini =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A04 +
> =A0recipes/genext2fs/genext2fs-1.4.1/volume.patch | =A0153 ++++++++++++++=
++++++++++
> =A0recipes/genext2fs/genext2fs-native_1.4.1.bb =A0 =A0| =A0 10 ++
> =A0recipes/genext2fs/genext2fs_1.4.1.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A09 ++
> =A04 files changed, 176 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/genext2fs/genext2fs-1.4.1/volume.patch
> =A0create mode 100644 recipes/genext2fs/genext2fs-native_1.4.1.bb
> =A0create mode 100644 recipes/genext2fs/genext2fs_1.4.1.bb
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index bea59ad..395dcd9 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -7226,6 +7226,10 @@ sha256=3D5af6001401a6bc04c075474be5d8aeb2bdb2ca3e5=
09022c2fc55ca7c7f310256
> =A0md5=3Dfd0337e89778e2dba74461c555ea8e42
> =A0sha256=3De50495d292a1d456c28044efbf07c16d8865f8d95e1caba86f4c5b2e3fb1d=
28f
>
> +[http://downloads.sourceforge.net/genext2fs/genext2fs-1.4.1.tar.gz]
> +md5=3Db7b6361bcce2cedff1ae437fadafe53b
> +sha256=3D404dbbfa7a86a6c3de8225c8da254d026b17fd288e05cec4df2cc7e1f4feecf=
c
> +
> =A0[http://downloads.sourceforge.net/genext2fs/genext2fs-1.4rc1.tar.gz]
> =A0md5=3D664431bf6737df1c265500e1f0b5d40c
> =A0sha256=3De60f88763ee12c02a5c7ade1a58925ef0ab198f9ec6aaf404747dfc29074c=
7be
> diff --git a/recipes/genext2fs/genext2fs-1.4.1/volume.patch b/recipes/gen=
ext2fs/genext2fs-1.4.1/volume.patch
> new file mode 100644
> index 0000000..825fc35
> --- /dev/null
> +++ b/recipes/genext2fs/genext2fs-1.4.1/volume.patch
> @@ -0,0 +1,153 @@
> +---
> + genext2fs.c | =A0 26 +++++++++++++++++++-------
> + 1 file changed, 19 insertions(+), 7 deletions(-)
> +
> +--- genext2fs-1.4.1.orig/genext2fs.c
> ++++ genext2fs-1.4.1/genext2fs.c
> +@@ -507,11 +507,13 @@ swab32(uint32 val)
> + #define utdecl32(x,n) uint32 x[n];
> +
> + typedef struct
> + {
> + =A0 =A0 =A0 superblock_decl
> +- =A0 =A0 =A0uint32 s_reserved[235]; =A0 =A0 =A0 // Reserved
> ++ =A0 =A0 =A0uint32 =A0s_reserved1[9];
> ++ =A0 =A0 =A0char s_volume[16];
> ++ =A0 =A0 =A0uint32 s_reserved2[222]; =A0 =A0 =A0 // Reserved
> + } superblock;
> +
> + typedef struct
> + {
> + =A0 =A0 =A0 groupdescriptor_decl
> +@@ -1219,11 +1221,11 @@ extend_blk(filesystem *fs, uint32 nod, b
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 lbw =3D bw;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bw =3D lbw;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 while(create)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int i, copyb =3D 0;
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if(!(fs->sb.s_reserved[200]=
 & OP_HOLES))
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if(!(fs->sb.s_reserved2[187=
] & OP_HOLES))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 copyb =3D 1=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 for(i =3D 0=
; i < BLOCKSIZE / 4; i++)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 if(((int32*)(b + BLOCKSIZE * (amount - create)))[i])
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 {
> +@@ -1891,11 +1893,12 @@ swap_badfs(filesystem *fs)
> + =A0 =A0 =A0 }
> + }
> +
> + // initialize an empty filesystem
> + static filesystem *
> +-init_fs(int nbblocks, int nbinodes, int nbresrvd, int holes, uint32 fs_=
timestamp)
> ++init_fs(int nbblocks, int nbinodes, int nbresrvd, int holes,
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0uint32 fs_timestamp, char *volumeid)
> + {
> + =A0 =A0 =A0 uint32 i;
> + =A0 =A0 =A0 filesystem *fs;
> + =A0 =A0 =A0 directory *d;
> + =A0 =A0 =A0 uint8 * b;
> +@@ -1956,10 +1959,13 @@ init_fs(int nbblocks, int nbinodes, int
> + =A0 =A0 =A0 fs->sb.s_inodes_per_group =3D nbinodes_per_group;
> + =A0 =A0 =A0 fs->sb.s_wtime =3D fs_timestamp;
> + =A0 =A0 =A0 fs->sb.s_magic =3D EXT2_MAGIC_NUMBER;
> + =A0 =A0 =A0 fs->sb.s_lastcheck =3D fs_timestamp;
> +
> ++ =A0 =A0 =A0if (volumeid !=3D NULL)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0strncpy(fs->sb.s_volume, volumeid, sizeof(f=
s->sb.s_volume));
> ++
> + =A0 =A0 =A0 // set up groupdescriptors
> + =A0 =A0 =A0 for(i=3D0, bbmpos=3Dgdsz+2, ibmpos=3Dbbmpos+1, itblpos=3Dib=
mpos+1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 i<nbgroups;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 i++, bbmpos+=3Dnbblocks_per_group, ibmpos+=
=3Dnbblocks_per_group, itblpos+=3Dnbblocks_per_group)
> + =A0 =A0 =A0 {
> +@@ -2055,11 +2061,11 @@ init_fs(int nbblocks, int nbinodes, int
> + =A0 =A0 =A0 fs->sb.s_state =3D 1;
> + =A0 =A0 =A0 fs->sb.s_max_mnt_count =3D 20;
> +
> + =A0 =A0 =A0 // options for me
> + =A0 =A0 =A0 if(holes)
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0fs->sb.s_reserved[200] |=3D OP_HOLES;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0fs->sb.s_reserved2[187] |=3D OP_HOLES;
> +
> + =A0 =A0 =A0 return fs;
> + }
> +
> + // loads a filesystem from disk
> +@@ -2351,11 +2357,11 @@ print_fs(filesystem *fs)
> +
> + static void
> + dump_fs(filesystem *fs, FILE * fh, int swapit)
> + {
> + =A0 =A0 =A0 uint32 nbblocks =3D fs->sb.s_blocks_count;
> +- =A0 =A0 =A0fs->sb.s_reserved[200] =3D 0;
> ++ =A0 =A0 =A0fs->sb.s_reserved2[187] =3D 0;
> + =A0 =A0 =A0 if(swapit)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swap_goodfs(fs);
> + =A0 =A0 =A0 if(fwrite(fs, BLOCKSIZE, nbblocks, fh) < nbblocks)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 perror_msg_and_die("output filesystem image=
");
> + =A0 =A0 =A0 if(swapit)
> +@@ -2465,10 +2471,11 @@ main(int argc, char **argv)
> + =A0 =A0 =A0 int squash_uids =3D 0;
> + =A0 =A0 =A0 int squash_perms =3D 0;
> + =A0 =A0 =A0 uint16 endian =3D 1;
> + =A0 =A0 =A0 int bigendian =3D !*(char*)&endian;
> + =A0 =A0 =A0 filesystem *fs;
> ++ =A0 =A0 =A0char *volumeid =3D NULL;
> + =A0 =A0 =A0 int i;
> + =A0 =A0 =A0 int c;
> + =A0 =A0 =A0 struct stats stats;
> +
> + #if HAVE_GETOPT_LONG
> +@@ -2477,10 +2484,11 @@ main(int argc, char **argv)
> + =A0 =A0 =A0 =A0 { "root", =A0 =A0 =A0 =A0 =A0 =A0 required_argument, =
=A0 =A0 =A0NULL, 'd' },
> + =A0 =A0 =A0 =A0 { "devtable", =A0 =A0 =A0 =A0 required_argument, =A0 =
=A0 =A0NULL, 'D' },
> + =A0 =A0 =A0 =A0 { "size-in-blocks", =A0 required_argument, =A0 =A0 =A0N=
ULL, 'b' },
> + =A0 =A0 =A0 =A0 { "bytes-per-inode", =A0required_argument, =A0 =A0 =A0N=
ULL, 'i' },
> + =A0 =A0 =A0 =A0 { "number-of-inodes", required_argument, =A0 =A0 =A0NUL=
L, 'N' },
> ++ =A0 =A0 =A0 =A0{ "volume-id", =A0 =A0 =A0 =A0required_argument, =A0 =
=A0 =A0NULL, 'L' },
> + =A0 =A0 =A0 =A0 { "reserved-percentage", required_argument, =A0 NULL, '=
m' },
> + =A0 =A0 =A0 =A0 { "block-map", =A0 =A0 =A0 =A0required_argument, =A0 =
=A0 =A0NULL, 'g' },
> + =A0 =A0 =A0 =A0 { "fill-value", =A0 =A0 =A0 required_argument, =A0 =A0 =
=A0NULL, 'e' },
> + =A0 =A0 =A0 =A0 { "allow-holes", =A0 =A0 =A0no_argument, =A0 =A0 =A0 =
=A0 =A0 =A0NULL, 'z' },
> + =A0 =A0 =A0 =A0 { "faketime", =A0 =A0 =A0 =A0 no_argument, =A0 =A0 =A0 =
=A0 =A0 =A0NULL, 'f' },
> +@@ -2493,11 +2501,11 @@ main(int argc, char **argv)
> + =A0 =A0 =A0 =A0 { 0, 0, 0, 0}
> + =A0 =A0 =A0 } ;
> +
> + =A0 =A0 =A0 app_name =3D argv[0];
> +
> +- =A0 =A0 =A0while((c =3D getopt_long(argc, argv, "x:d:D:b:i:N:m:g:e:zfq=
UPhVv", longopts, NULL)) !=3D EOF) {
> ++ =A0 =A0 =A0while((c =3D getopt_long(argc, argv, "x:d:D:b:i:N:L:m:g:e:z=
fqUPhVv", longopts, NULL)) !=3D EOF) {
> + #else
> + =A0 =A0 =A0 app_name =3D argv[0];
> +
> + =A0 =A0 =A0 while((c =3D getopt(argc, argv, =A0 =A0 =A0"x:d:D:b:i:N:m:g=
:e:zfqUPhVv")) !=3D EOF) {
> + #endif /* HAVE_GETOPT_LONG */
> +@@ -2517,10 +2525,13 @@ main(int argc, char **argv)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bytes_per_i=
node =3D SI_atof(optarg);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 case 'N':
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nbinodes =
=3D SI_atof(optarg);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case 'L':
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0volumeid =
=3D optarg;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 case 'm':
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reserved_fr=
ac =3D SI_atof(optarg) / 100;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 case 'g':
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 gopt[gidx++=
] =3D optarg;
> +@@ -2607,11 +2618,12 @@ main(int argc, char **argv)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if(tmp_nbinodes > nbinodes)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nbinodes =
=3D tmp_nbinodes;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if(fs_timestamp =3D=3D -1)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fs_timestamp =3D time(NULL)=
;
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0fs =3D init_fs(nbblocks, nbinodes, nbresrvd=
, holes, fs_timestamp);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0fs =3D init_fs(nbblocks, nbinodes, nbresrvd=
, holes,
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fs_timestam=
p, volumeid);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 populate_fs(fs, dopt, didx, squash_uids, squash_perms, fs_t=
imestamp, NULL);
> +
> + =A0 =A0 =A0 if(emptyval) {
> diff --git a/recipes/genext2fs/genext2fs-native_1.4.1.bb b/recipes/genext=
2fs/genext2fs-native_1.4.1.bb
> new file mode 100644
> index 0000000..50b371b
> --- /dev/null
> +++ b/recipes/genext2fs/genext2fs-native_1.4.1.bb
> @@ -0,0 +1,10 @@
> +require genext2fs_${PV}.bb
> +inherit native
> +
> +do_stage () {
> + =A0 =A0 =A0 install -m 0755 genext2fs ${STAGING_BINDIR}/
> +}
> +
> +do_install () {
> + =A0 =A0 =A0 :
> +}
> diff --git a/recipes/genext2fs/genext2fs_1.4.1.bb b/recipes/genext2fs/gen=
ext2fs_1.4.1.bb
> new file mode 100644
> index 0000000..10ad9de
> --- /dev/null
> +++ b/recipes/genext2fs/genext2fs_1.4.1.bb
> @@ -0,0 +1,9 @@
> +require genext2fs.inc
> +
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/genext2fs/genext2fs-${PV}.tar.gz \
> + =A0 =A0 =A0 =A0 =A0file://volume.patch;patch=3D1"
> +
> +DEFAULT_PREFERENCE =3D "1"
> +
> +inherit autotools
> --
> 1.6.3.rc0
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


